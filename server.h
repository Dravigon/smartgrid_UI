#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QtCharts/QChartView>
#include <QtCharts/QLineSeries>
#include <QtCharts/QDateTimeAxis>
#include <QtCharts/QCategoryAxis>
#include <QDateTime>


using namespace QtCharts;

class Server : public QObject
{
    Q_OBJECT
    QString m_username=(NULL);
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)

public:
    explicit Server(QObject *parent = 0);
    QString username() const;
    void setUsername(QString username){
        m_username=username;
        emit usernameChanged(username);
    }
    Q_INVOKABLE void setLineSeries(QLineSeries* lineSeries);
    Q_INVOKABLE QDateTimeAxis *getAxisXTime();
    QDateTimeAxis xValue;
    Q_INVOKABLE bool authenticate(QString password);
signals:
    void usernameChanged(QString);

public slots:
};

#endif // SERVER_H
