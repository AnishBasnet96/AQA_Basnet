#include "controller.h"
#include "healingworker.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    m_WorkerThread = new QThread(this);
    m_HealingWorker = new HealingWorker;

    connect(m_WorkerThread, &QThread::finished, m_HealingWorker, &QObject::deleteLater);
    connect(this, &Controller::startRequested, m_HealingWorker, &HealingWorker::startHealing );
    connect(this, &Controller::stopRequested, m_HealingWorker, &HealingWorker::stopHealing );
    connect(m_HealingWorker, &HealingWorker::finished, this, [this](){setmode("idle"); });

    m_HealingWorker->moveToThread(m_WorkerThread);

    m_WorkerThread->start();
}

Controller::~Controller()
{
    m_WorkerThread->quit();
    m_WorkerThread->wait();
}

void Controller::setage(int a)
{
    if (m_age == a) return;

    m_age = a;
    emit ageChanged();
}

void Controller::setgender(int g)
{
    if (m_gender == g) return;

    m_gender = g;
    emit genderChanged();
}

void Controller::startHealing()
{
    setmode("healing");
    emit startRequested();
}

void Controller::stopHealing()
{
    setmode("idle");
    emit stopRequested();
}

void Controller::setmode(const QString &m)
{
    if (m_mode == m) return;
    m_mode = m;
    emit modeChanged();
}
