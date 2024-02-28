#include "authorization.h"
#include <QDebug>

Authorization::Authorization(QObject *parent) : QObject(parent)
{}

QString Authorization::generateCode()
{
    // Генерация четырехзначного кода (пока это просто "0 0 0 0")
    QString code = "0 0 0 0";
    emit codeSent(code);

    return code;
}

void Authorization::enterCode(const QString &code)
{
    // Обработка введенного кода
    qDebug() << "Entered code:" << code;
    emit codeEntered(code);
}
