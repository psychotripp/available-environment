import QtQuick 2.15
import QtQuick.Controls 2.15

Row
{
    id: upperButtonRow
    width: parent.width
    height: 50
    anchors
    {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
    }

    Button
    {
        id: backButton
        width: 50
        height: 50
        background: Rectangle
        {
            color: backButton.pressed ? "#57bbbc" : "#3b373b"
            border.color: "#dddbde"
            border.width: 1
        }

        anchors
        {
            left: parent.left
            top: parent.top
        }

        Text
        {
            id: guideArrowText
            text: "🡠"
            anchors.verticalCenter: backButton.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: backButton.horizontalCenter
            font.pointSize: 26
            color: "#dddbde"
        }

        Connections
        {
            target: backButton
            onClicked: stackView.push("HomeForm.ui.qml")
        }
    }

    Button
    {
        id: toMainButton
        width: 50
        height: 50
        background: Rectangle
        {
            color: toMainButton.pressed ? "#57bbbc" : "#3b373b"
            border.color: "#dddbde"
            border.width: 1
        }


        anchors
        {
            right: parent.right
            top: parent.top
        }

        Image
        {
            id: toMainImage
            width: 40
            height: 40
            horizontalAlignment: Image.AlignHCenter
            fillMode: Image.PreserveAspectFit
            source: "content/images/home.svg"
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            anchors
            {
                verticalCenter: toMainButton.verticalCenter
                horizontalCenter: toMainButton.horizontalCenter
            }
        }

        Connections
        {
            target: toMainButton
            onClicked: stackView.push("HomeForm.ui.qml")
        }
    }
}
