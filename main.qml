import QtQuick 2.7
import  QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0


ApplicationWindow{
    id:root
    visible: true
    width: 1240
    height: 748
        visibility:"Maximized"

    Column{
        height: parent.height/2

        anchors.centerIn: parent
        spacing: 10

        Text {
            id: name
            //anchors.
            x:-10
            text: qsTr("SMART GRID")
            font.pixelSize: 68

        }


        TextField {
            id: username

            width: parent.width

            text: qsTr("Username")
            onTextChanged: {myserver.username=text}
        }

        TextField {
            id: password
             width: parent.width
            text: qsTr("password")
            echoMode:"Password"
        }

        Button {
            id: login
            x:150
            width:parent.width/4
            text: qsTr("Login")
            onClicked: {root.visible=!(welcome.visible=myserver.authenticate(password.text))

            }
        }
    }


    Welcome{
        id:welcome
        visible: false
    }

    TextField {
        id: hostname
        x: 288
        y: 80
        width: 208
        height: 43
        text: qsTr("localhost")
        onTextChanged:myserver.setDatabase(text,database.text,port.text);
    }

    TextField {
        id: database
        x: 510
        y: 80
        width: 187
        height: 43
        text: qsTr("smartgrid")
        onTextChanged:myserver.setDatabase(hostname.text,text,port.text);
    }

    TextField {
        id: port
        x: 716
        y: 80
        width: 128
        height: 43
        text: qsTr("3306")
        onTextChanged:myserver.setDatabase(hostname.text,database.text,text);
    }
}

