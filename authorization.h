#ifndef AUTHORIZATION_H
#define AUTHORIZATION_H

#include <QObject>

class Authorization : public QObject
{
    Q_OBJECT

public:
    explicit Authorization(QObject *parent = nullptr);
    QString generateCode();

public slots:
    void enterCode(const QString &code);

signals:
    void codeSent(const QString &code);
    void codeEntered(const QString &code);
};

#endif // AUTHORIZATION_H
