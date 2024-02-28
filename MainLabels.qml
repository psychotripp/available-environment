import QtQuick 2.0
import QtQuick.Controls 2.0

Item
{
    property string mainText: "Default Text"
    property string secondaryText: "Default Text"
    width: parent.width

    Label
    {
        color: "#dddbde"
        text: mainText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.DemiBold
        font.family: "Roboto"
        topPadding: 30
        font.pointSize: 16
        anchors.fill: parent
    }

    Label
    {
        height: 320
        color: "#dddbde"
        text: secondaryText
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        topPadding: 90
        font.weight: Font.Normal
        font.family: "Roboto"
        leftPadding: 30
        font.pointSize: 18
        anchors.left: parent.left
    }
}
