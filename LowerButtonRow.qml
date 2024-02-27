import QtQuick 2.15
import QtQuick.Controls 2.15

Row
{
    id: buttonsRow
    width: parent.width
    height: 50
    anchors
    {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }

    // Кнопка "Речь"
    Button
    {
        id: speechButton
        width: buttonsRow.width
        height: 50
        background: Rectangle
        {
            color: speechButton.pressed ? "#57bbbc" : "#3b373b"
            border.color: "#dddbde"
            border.width: 1
        }
        anchors
        {
            left: parent.left
            right: buttonsRow.horizontalCenter
            bottom: parent.bottom
        }

        Text
        {
            id: speechText
            text: "Речь"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            font.family: "Roboto"
            font.pointSize: 14
            color: "#dddbde"
            anchors
            {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }

        Image
        {
            id: speechImage
            width: 30
            height: 30
            visible: true
            horizontalAlignment: Image.AlignHCenter
            fillMode: Image.PreserveAspectFit
            source: "content/images/microphone.svg"
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            anchors
            {
                verticalCenter: parent.verticalCenter
                right: speechText.left
                rightMargin: 10
            }
        }
    }

    // Кнопка "Маршрут"
    Button
    {
        id: routeButton
        width: buttonsRow.width
        height: 50
        background: Rectangle
        {
            color: routeButton.pressed ? "#57bbbc" : "#3b373b"
            border.color: "#dddbde"
            border.width: 1
        }
        anchors
        {
            right: parent.right
            left: buttonsRow.horizontalCenter
            bottom: parent.bottom
        }

        Text
        {
            id: routeText
            text: "Маршрут"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Normal
            font.family: "Roboto"
            font.pointSize: 14
            color: "#dddbde"
            anchors
            {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }

        Image
        {
            id: routeImage
            width: 30
            height: 30
            horizontalAlignment: Image.AlignHCenter
            fillMode: Image.PreserveAspectFit
            source: "content/images/route.svg"
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            anchors
            {
                verticalCenter: parent.verticalCenter
                right: routeText.left
                rightMargin: 10
            }
        }
    }
}
