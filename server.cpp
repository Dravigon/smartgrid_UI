#include "server.h"
#include <QDebug>

QT_CHARTS_USE_NAMESPACE

 Q_DECLARE_METATYPE(QAbstractSeries *)
 Q_DECLARE_METATYPE(QDateTimeAxis *)

Server::Server(QObject *parent) : QObject(parent)
{

}

QString Server::username() const
{
    return m_username;
}

void Server::setLineSeries(QLineSeries *lineSeries)
{
    QLineSeries *bloodSugarSeries = new QLineSeries();

           QPen penBloodSugar;
           penBloodSugar.setColor(QColor(34, 102, 102));
           penBloodSugar.setWidth(5);

           bloodSugarSeries->setPen(penBloodSugar);

            lineSeries->append(QDateTime(QDate(2000,1,1),QTime(0,0)).toMSecsSinceEpoch(),200);
            lineSeries->append(QDateTime(QDate(2002,1,1),QTime(0,0)).toMSecsSinceEpoch(),200);
           lineSeries= bloodSugarSeries;
}

QDateTimeAxis* Server::getAxisXTime()
{
    xValue.setTickCount(2);
     xValue.setFormat("MMM yyyy");
     xValue.setMin(QDateTime(QDate(2000,1,1),QTime(0,0)));
     xValue.setMax(QDateTime::currentDateTime());
     return &xValue;
}

bool Server::authenticate(QString password)
{
    if(password=="password")
        return  true;
    else
        return false;
}
