import QtQuick 2.7
import  QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0


Rectangle {
    id:ovwindow
    visible:false
    width: 1240
    height: 748
    signal backclicked
    Row{
        anchors.fill:parent
        spacing:250
        anchors.margins: 250
        Column{

            id:overview
           // height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            spacing: 20

            Label {
                id: labeloverview
                text: qsTr("Overview")
                font.pixelSize: 55
            }

            Text {
                id: energy
                text: qsTr("Energy")
                font.pixelSize: 25
            }

            Text {
                id: power
                text: qsTr("power")
                font.pixelSize: 25
            }

            Text {
                id: voltage
                text: qsTr("Voltage")
                font.pixelSize: 25
            }

            Text {
                id: current
                text: qsTr("Current")
                font.pixelSize: 25
            }

        }

            Image {
                id: image
                width: 200
                height: 200
                source: "qrc:/battery-status-full.jpg"

            }
    }
    Button{
        x: 8
        y: 8
        text: "back"
        onClicked: backclicked()
    }
}
