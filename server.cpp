#include "server.h"
#include <QDebug>

QT_CHARTS_USE_NAMESPACE

 Q_DECLARE_METATYPE(QAbstractSeries *)
 Q_DECLARE_METATYPE(QDateTimeAxis *)

Server::Server(QObject *parent) : QObject(parent)
{
}

Server::~Server()
{
    db.close();
}



QString Server::username() const
{
    return m_username;
}

void Server::setDatabase(QString hn, QString db,int por)
{
    hostname=hn;
    database=db;
    port=por;
}

void Server::setLineSeries(QLineSeries *lineSeries)
{

           QPen pentemp;
           pentemp.setColor(QColor(34, 102, 102));
           pentemp.setWidth(5);

           lineSeries->setPen(pentemp);
           lineSeries->clear();
           QSqlQuery query("SELECT * FROM "+database+".`usage`");
           QSqlRecord rec = query.record();
           qDebug() << "Number of columns: " << rec.count();

           int timeCol = rec.indexOf("time"); // index of the field "name"
           int energyCol = rec.indexOf("energy");
           qDebug()<<timeCol;
           while (query.next()){
               qDebug() << query.value(timeCol); // output all names
               lineSeries->append(QDateTime(query.value(timeCol).toDate(),QTime(0,0)).toMSecsSinceEpoch(), query.value(energyCol).toDouble());
           }
            query.clear();


}

float Server::queryLatest(QString qry)
{
    QSqlQuery query("SELECT * FROM "+database+".`usage`");
    QSqlRecord rec = query.record();


    int Col = rec.indexOf(qry);
   if(query.last()){
       qDebug()<<"value ssad "<<qry<<"  "<<query.value(Col).toFloat();
       return query.value(Col).toFloat();
   }
   else
       return 0.0;
}

QDateTimeAxis* Server::getAxisXTime()
{
    xValue.setTickCount(4);
     xValue.setFormat("MMM yyyy");

     QSqlQuery query("SELECT * FROM "+database+".`usage`");
     QSqlRecord rec = query.record();

     qDebug() << "Number of columns: " << rec.count();
     int timeCol = rec.indexOf("time");
    int index=0;


         if(query.first())
          {xValue.setMin(QDateTime(query.value(timeCol).toDate(),QTime(0,0)));index++;}
       if(query.last())
            {xValue.setMax(QDateTime(query.value(timeCol).toDate(),QTime(0,0)));index++;}

     return &xValue;
}

bool Server::authenticate(QString password)
{
    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName(hostname);
    db.setDatabaseName(database);
    db.setUserName(m_username);
    db.setPassword(password);
    db.setPort(port);
    bool ret= db.open();
    qDebug()<<db.hostName();
    return ret;
}
