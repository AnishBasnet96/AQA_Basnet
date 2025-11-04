#ifndef HEALINGWORKER_H
#define HEALINGWORKER_H

#include <QObject>

class HealingWorker : public QObject
{
    Q_OBJECT
public:
    explicit HealingWorker(QObject *parent = nullptr);

signals:
};

#endif // HEALINGWORKER_H
