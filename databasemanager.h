#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QVariantList>

class DatabaseManager : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);

    bool connect();
    bool addClient(const QString &phoneNumber, const QString &disabilityType);
    bool addTrip(const QString &phoneNumber, const QString &departure, const QString &destination, const QDate &date);
    bool addRoute(const QString &routeNumber, double fare, const QString &departure, const QString &destination);
    bool addTripRoute(const QString &routeNumber, const QString &phoneNumber, const QString &tripId);

    bool removeClient(const QString &phoneNumber);
    bool removeTrip(const QString &tripId);
    bool removeRoute(const QString &routeNumber);
    bool removeTripRoute(const QString &routeNumber, const QString &tripId);

public slots:
    void printContents();


private:
    QSqlDatabase m_db;

    bool createTables();
};

#endif // DATABASEMANAGER_H
