import QtQuick 2.15
import QtQuick.Controls 2.15

Page
{
    id: homePage
    anchors.fill: parent

    Rectangle
    {
        id: homeRect
        color: "#656e77"
        anchors.fill: parent

        Label
        {
            id: mainText
            color: "#dddbde"
            text: qsTr("Главная")
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
            id: greetingsText
            color: "#dddbde"
            text: qsTr("Здравствуйте")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            topPadding: 90
            font.weight: Font.Normal
            font.family: "Roboto"
            leftPadding: 30
            font.pointSize: 18
            anchors.left: parent.left
        }

        Column
        {
            id: buttonsColumn
            topPadding: 130
            spacing: 2
            anchors
            {
                left: parent.left
                right: parent.right
            }

            CustomButton
            {
                buttonText: "Настройки"
            }

            CustomButton
            {
                buttonText: "Обучение"
            }

            CustomButton
            {
                buttonText: "Профиль"
            }

            CustomButton
            {
                buttonText: "Отзыв"
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:640;width:360}
}
##^##*/
