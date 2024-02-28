import QtQuick 2.15
import QtQuick.Controls 2.15

Page
{
    id: settingsPage
    anchors.fill: parent

    Rectangle
    {
        id: settingsRect
        color: "#656e77"
        anchors.fill: parent

        MainLabels
        {
            mainText: "Меню"
            secondaryText: "Настройки"
        }

        UpperButtonRow{}
        LowerButtonRow{}
    }
}
