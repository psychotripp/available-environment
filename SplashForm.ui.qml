import QtQuick 2.15
import QtQuick.Controls 2.15

Page
{
    id: splashPage
    anchors.fill: parent

    Rectangle
    {
        id: splashRect
        color: "#dddbde"
        anchors.fill: parent
    }

    Label
    {
        id: splashLabel
        color: "#656e77"
        text: qsTr("Доступная среда")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.DemiBold
        font.family: "Roboto"
        font.pointSize: 20
        anchors.centerIn: parent
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:640;width:360}
}
##^##*/
