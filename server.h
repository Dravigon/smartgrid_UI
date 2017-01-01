#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QtCharts/QChartView>
#include <QtCharts/QLineSeries>
#include <QtCharts/QDateTimeAxis>
#include <QtCharts/QCategoryAxis>
#include <QDateTime>
//#include <QtSql/QSqlDatabase>
#include <QtSql>
#include <memory>

using namespace QtCharts;

static QDateTimeAxis xValue;

class Server : public QObject
{
    Q_OBJECT
    QString m_username=(NULL);
    QString hostname,database;
    int port;

    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
     QSqlDatabase db;

public:
    explicit Server(QObject *parent = 0);
     ~Server();
    QString username() const;
    void setUsername(QString username){
        m_username=username;
        emit usernameChanged(username);
    }

    Q_INVOKABLE void setDatabase(QString,QString,int);
    Q_INVOKABLE void setLineSeries(QLineSeries* lineSeries);
    Q_INVOKABLE float queryLatest(QString qry);
    Q_INVOKABLE QDateTimeAxis* getAxisXTime();

    Q_INVOKABLE bool authenticate(QString password);
signals:
    void usernameChanged(QString);

public slots:
};

#endif // SERVER_H
