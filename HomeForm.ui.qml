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

        MainLabels
        {
            mainText: "Главная"
            secondaryText: "Здравствуйте"
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

                Connections
                {
                    onClicked: stackView.push("SettingsForm.ui.qml")
                }
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

        LowerButtonRow{}
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:640;width:360}
}
##^##*/
