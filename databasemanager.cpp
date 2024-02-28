#include "databasemanager.h"
#include <QDate>
#include <QDebug>

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent)
{}

bool DatabaseManager::connect()
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("path_to_your_database_file.db");

    if (!m_db.open())
    {
        qDebug() << "Error: could not connect to database.";
        qDebug() << m_db.lastError().text();

        return false;
    }

    if (!createTables())
    {
        qDebug() << "Error: could not create tables.";

        return false;
    }

    return true;
}

bool DatabaseManager::createTables()
{
    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS client (phone_number TEXT PRIMARY KEY, disability_type TEXT)"))
        return false;
    if (!query.exec("CREATE TABLE IF NOT EXISTS trip (trip_id INTEGER PRIMARY KEY AUTOINCREMENT, phone_number TEXT, departure TEXT, destination TEXT, date TEXT)"))
        return false;
    if (!query.exec("CREATE TABLE IF NOT EXISTS route (route_number TEXT PRIMARY KEY, fare REAL, departure TEXT, destination TEXT)"))
        return false;
    if (!query.exec("CREATE TABLE IF NOT EXISTS trip_route (route_number TEXT, trip_id INTEGER, PRIMARY KEY (route_number, trip_id))"))
        return false;

    return true;
}

bool DatabaseManager::addClient(const QString &phoneNumber, const QString &disabilityType)
{
    QSqlQuery query;
    query.prepare("INSERT INTO client (phone_number, disability_type) VALUES (:phoneNumber, :disabilityType)");
    query.bindValue(":phoneNumber", phoneNumber);
    query.bindValue(":disabilityType", disabilityType);

    return query.exec();
}

bool DatabaseManager::addTrip(const QString &phoneNumber, const QString &departure, const QString &destination, const QDate &date)
{
    QSqlQuery query;
    query.prepare("INSERT INTO trip (phone_number, departure, destination, date) VALUES (:phoneNumber, :departure, :destination, :date)");
    query.bindValue(":phoneNumber", phoneNumber);
    query.bindValue(":departure", departure);
    query.bindValue(":destination", destination);
    query.bindValue(":date", date.toString("yyyy-MM-dd"));

    return query.exec();
}

bool DatabaseManager::addRoute(const QString &routeNumber, double fare, const QString &departure, const QString &destination)
{
    QSqlQuery query;
    query.prepare("INSERT INTO route (route_number, fare, departure, destination) VALUES (:routeNumber, :fare, :departure, :destination)");
    query.bindValue(":routeNumber", routeNumber);
    query.bindValue(":fare", fare);
    query.bindValue(":departure", departure);
    query.bindValue(":destination", destination);

    return query.exec();
}

bool DatabaseManager::addTripRoute(const QString &routeNumber, const QString &phoneNumber, const QString &tripId)
{
    QSqlQuery query;
    query.prepare("INSERT INTO trip_route (route_number, trip_id) VALUES (:routeNumber, (SELECT trip_id FROM trip WHERE phone_number = :phoneNumber AND trip_id = :tripId))");
    query.bindValue(":routeNumber", routeNumber);
    query.bindValue(":phoneNumber", phoneNumber);
    query.bindValue(":tripId", tripId);

    return query.exec();
}

bool DatabaseManager::removeClient(const QString &phoneNumber)
{
    QSqlQuery query;
    query.prepare("DELETE FROM client WHERE phone_number = :phoneNumber");
    query.bindValue(":phoneNumber", phoneNumber);

    return query.exec();
}

bool DatabaseManager::removeTrip(const QString &tripId)
{
    QSqlQuery query;
    query.prepare("DELETE FROM trip WHERE trip_id = :tripId");
    query.bindValue(":tripId", tripId);

    return query.exec();
}

bool DatabaseManager::removeRoute(const QString &routeNumber)
{
    QSqlQuery query;
    query.prepare("DELETE FROM route WHERE route_number = :routeNumber");
    query.bindValue(":routeNumber", routeNumber);

    return query.exec();
}

bool DatabaseManager::removeTripRoute(const QString &routeNumber, const QString &tripId)
{
    QSqlQuery query;
    query.prepare("DELETE FROM trip_route WHERE route_number = :routeNumber AND trip_id = :tripId");
    query.bindValue(":routeNumber", routeNumber);
    query.bindValue(":tripId", tripId);

    return query.exec();
}
void DatabaseManager::printContents()
{
    QSqlQuery query;
    query.exec("SELECT * FROM client");
    qDebug() << "Clients:";

    while (query.next())
    {
        QString phoneNumber = query.value(0).toString();
        QString disabilityType = query.value(1).toString();
        qDebug() << "Phone Number:" << phoneNumber << ", Disability Type:" << disabilityType;
    }

    query.exec("SELECT * FROM trip");
    qDebug() << "Trips:";

    while (query.next())
    {
        QString tripId = query.value(0).toString();
        QString phoneNumber = query.value(1).toString();
        QString departure = query.value(2).toString();
        QString destination = query.value(3).toString();
        QString date = query.value(4).toString();
        qDebug() << "Trip ID:" << tripId << ", Phone Number:" << phoneNumber << ", Departure:" << departure << ", Destination:" << destination << ", Date:" << date;
    }

    query.exec("SELECT * FROM route");
    qDebug() << "Routes:";

    while (query.next())
    {
        QString routeNumber = query.value(0).toString();
        double fare = query.value(1).toDouble();
        QString departure = query.value(2).toString();
        QString destination = query.value(3).toString();
        qDebug() << "Route Number:" << routeNumber << ", Fare:" << fare << ", Departure:" << departure << ", Destination:" << destination;
    }

    query.exec("SELECT * FROM trip_route");
    qDebug() << "Trip Routes:";

    while (query.next())
    {
        QString routeNumber = query.value(0).toString();
        QString tripId = query.value(1).toString();
        qDebug() << "Route Number:" << routeNumber << ", Trip ID:" << tripId;
    }
}
