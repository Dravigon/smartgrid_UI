#include <server.h>

#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QScopedPointer<Server> myserver(new Server);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myserver",myserver.data());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    return app.exec();
}
