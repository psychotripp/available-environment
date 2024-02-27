import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow
{
    id: window
    width: 360
    height: 640
    visible: true
    title: qsTr("Available environment")

    StackView
    {
        id: stackView
        initialItem: ("SplashForm.ui.qml")
        anchors.fill: parent
    }

    // Временное решение для демонстрации, позже время перехода между страницами будет определяться загрузкой модулей
    Timer
    {
        id: timer
        interval: 500
        running: true
        repeat: false
        onTriggered: stackView.push("HomeForm.ui.qml")
    }
}
