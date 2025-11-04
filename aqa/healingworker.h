#ifndef HEALINGWORKER_H
#define HEALINGWORKER_H

#include <QObject>

class HealingWorker : public QObject
{
    Q_OBJECT
public:
    explicit HealingWorker(QObject *parent = nullptr);

public slots:
    void startHealing();
    void stopHealing();

signals:
    void finished();

private:
    bool m_stop{false};
};

#endif // HEALINGWORKER_H
