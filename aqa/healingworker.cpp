#include "healingworker.h"

HealingWorker::HealingWorker(QObject *parent)
    : QObject{parent}
{}

void HealingWorker::startHealing()
{
    //simulate some healing job if time is left
    m_stop = false;
}

void HealingWorker::stopHealing()
{
    if (m_stop == true) return;

    m_stop = true;
    emit finished();
}
