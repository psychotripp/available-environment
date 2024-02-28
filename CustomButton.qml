import QtQuick 2.15
import QtQuick.Controls 2.15

Button
{
    property string buttonText: "Default Text"
    width: parent.width
    height: 50
    background: Rectangle
    {
        color: pressed ? "#57bbbc" : "#cad4df"
    }

    Text
    {
        text: buttonText
        font.weight: Font.Normal
        font.family: "Roboto"
        leftPadding: 30
        font.pointSize: 16
        color: pressed ? "#dddbde" : "#656e77"
        anchors
        {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    Text
    {
        text: "🡢"
        font.weight: Font.Normal
        font.family: "Roboto"
        rightPadding: 30
        font.pointSize: 26
        color: pressed ? "#dddbde" : "#656e77"
        anchors
        {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
    }
}
