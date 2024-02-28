#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>

#include <QDate>
#include "databasemanager.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();

    for (const QString &locale : uiLanguages)
    {
        const QString baseName = "availableenvironment_" + QLocale(locale).name();

        if (translator.load(":/i18n/" + baseName))
        {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    DatabaseManager dbManager;

    if (!dbManager.connect())
    {
        qDebug() << "Failed to connect to database.";
        return -1;
    }

    // Добавление клиента
    dbManager.addClient("123456789", "Some Disability Type");

    // Добавление поездки
    dbManager.addTrip("123456789", "Departure", "Destination", QDate::currentDate());

    // Добавление маршрута
    dbManager.addRoute("Route1", 10.0, "Departure", "Destination");

    // Добавление маршрута к поездке
    dbManager.addTripRoute("Route1", "123456789", "1");

    dbManager.printContents();

    // Удаление клиента
    dbManager.removeClient("123456789");

    dbManager.printContents();

    return app.exec();
}
