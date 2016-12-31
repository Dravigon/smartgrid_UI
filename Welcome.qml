import QtQuick 2.7
import  QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {

    property var username: "x"

    onVisibleChanged: visibility="Maximized"

    width: 1240
    height: 748
Rectangle{
        id:wel
        anchors.fill: parent
    Column{

        height: parent.height/2
        anchors.centerIn: parent
        spacing: 20

        Label {
            id: label
            x: -100

            width: 100
            height: 50
            text: qsTr("Welcome Mr."+myserver.username)
            font.pixelSize: 60
        }

        Button {
            id: overview
            width: 200
            height: 50
            text: qsTr("Overview")
            onClicked:{ov.visible=!(wel.visible=(false));}
        }

        Button {
            id: housecon
            width: 200
            height: 50
            text: qsTr("House consumption")
            onClicked:{hc.visible=!(wel.visible=(false));}
        }

        Button {
            id: gridcon
            width: 200
            height: 50
            text: qsTr("grid Consumption")
            onClicked:{gcon.visible=!(wel.visible=(false));}
        }

        Button {
            id: housepro
            width: 200
            height: 50
            text: qsTr("House Production")
            onClicked:{hprod.visible=!(wel.visible=(false));}
        }

        Button {
            id: revenue
            width: 200
            height: 50
            text: qsTr("Revenue")
        }

    }
}
    Overview{
        id:ov
        visible: false
        onBackclicked: {visible=false
            wel.visible=true
        }
}
    HouseConsumption{
        id:hc
        visible: false
        onBackclicked: {visible=false
            wel.visible=true
        }
    }
    GridConsumption{
        id:gcon
        visible: false
        onBackclicked: {visible=false
            wel.visible=true
        }
    }
    HouseProduction{
        id:hprod
        visible: false
        onBackclicked: {visible=false
            wel.visible=true
        }
    }
}
