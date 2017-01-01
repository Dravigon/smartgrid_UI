import QtQuick 2.7
import  QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

Rectangle {
    visible: true
    width: 1240
    height: 748
    signal backclicked

        Column{

            id:rev
            anchors {
                horizontalCenter:  parent.horizontalCenter
            }

            anchors.verticalCenter: parent.verticalCenter
            spacing: 50

            Text {
                id: agen
                text: qsTr("Amount Generated")
                font.pixelSize: 25
            }


            Text {
                id: apaid
                text: qsTr("Amount to be Paid")
                font.pixelSize: 25
            }


        }



    Button{
        x: 8
        y: 8
        text: "back"
        onClicked: backclicked()
    }
}
