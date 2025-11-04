#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QThread>

class HealingWorker;

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int age READ age  NOTIFY ageChanged FINAL)
    Q_PROPERTY(int gender READ gender  NOTIFY genderChanged FINAL)
    Q_PROPERTY(QString mode READ mode NOTIFY modeChanged FINAL)

public:
    explicit Controller(QObject *parent = nullptr);
    ~Controller();

    int age () const
    {
        return m_age;
    }

    int gender () const
    {
        return m_gender;
    }

    QString mode () const
    {
        return m_mode;
    }

signals:
    void ageChanged();
    void genderChanged();
    void modeChanged();

    void startRequested();
    void stopRequested();

public slots:
    void setage(int a);
    void setgender(int g);

    void startHealing();
    void stopHealing();

private:
    void setmode(const QString &m);

    int m_age{0};
    int m_gender{0};
    QString m_mode{"idle"};
    HealingWorker *m_HealingWorker{nullptr};
    QThread * m_WorkerThread{nullptr};
};

#endif // CONTROLLER_H
