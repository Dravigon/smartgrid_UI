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
            width:parent.width

            Text {
                anchors {

                    horizontalCenter:  parent.horizontalCenter
                }
                id: text1
                font.pixelSize: 50
                text: "Welcome "+myserver.username
                wrapMode: Text.Wrap
                horizontalAlignment:Text.AlignHCenter
            }

            Button {
                id: overview
                anchors {
                    horizontalCenter:  parent.horizontalCenter
                }
                width: 200
                height: 50
                text: qsTr("Overview")
                onClicked:{ov.visible=!(wel.visible=(false));}
            }

            Button {
                id: housecon
                anchors {
                    horizontalCenter:  parent.horizontalCenter
                }
                width: 200
                height: 50
                text: qsTr("House consumption")
                onClicked:{hc.visible=!(wel.visible=(false));}
            }

            Button {
                id: gridcon
                width: 200
                height: 50
                anchors {
                    horizontalCenter:  parent.horizontalCenter
                }
                text: qsTr("grid Consumption")
                onClicked:{gcon.visible=!(wel.visible=(false));}
            }

            Button {
                id: housepro
                width: 200
                height: 50
                anchors {
                    horizontalCenter:  parent.horizontalCenter
                }
                text: qsTr("House Production")
                onClicked:{hprod.visible=!(wel.visible=(false));}
            }

            Button {
                id: revenue
                width: 200
                height: 50
                anchors {
                    horizontalCenter:  parent.horizontalCenter
                }
                text: qsTr("Revenue")
                onClicked:{rev.visible=!(wel.visible=(false));}
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
    Revenue{
        id:rev
        visible:false
        onBackclicked: {visible=false
            wel.visible=true
        }
    }
}
