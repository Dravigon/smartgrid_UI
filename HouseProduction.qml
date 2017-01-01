import QtQuick 2.7
import  QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0
import QtCharts 2.1



Rectangle {
    visible: false
    width: 1240
    height: 748
    signal backclicked
    property bool flag: false
       onVisibleChanged: addSeries()

    RowLayout {
        id: rowlayout
        x: 532
        y: 206
        anchors.fill: parent
        width: 1200
        height: 100

        ChartView{
            id: energyChart
            width: 800
            height: 650
            antialiasing: true

            DateTimeAxis{
                id: xTime
            }

            ValueAxis{
                id: yValues
                min:0
                max: 300
                tickCount: 10
            }


        }
        Column{

            id:hpcolumn

            anchors.verticalCenter: parent.verticalCenter
            spacing: 20

            Label {
                id: houseprod

                text: qsTr("House Production")
                font.pixelSize: 35
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

            Image {
                id: image
                width: 200
                height: 200
                source: "qrc:/battery-status-full.jpg"
            }
        }
    }

    function addSeries()
    {
        console.log(xTime.min)
        if(flag)
        {
             energyChart.removeAllSeries()
        }
        var mySeries = energyChart.createSeries(ChartView.SeriesTypeLine, "Line", myserver.getAxisXTime(), yValues);

        myserver.setLineSeries(mySeries);
    }


    Button{
        x: 8
        y: 8
        width: 78
        height: 48
        text: "back"
        onClicked:backclicked()

    }

    Timer {
        id: refreshTimer
        interval: 1 / 1 * 1000 // 60 Hz
        running: true
        repeat: true
        onTriggered: {
            energy.text=qsTr("Energy :"+myserver.queryLatest("energy"));
            power.text=qsTr("Power :"+myserver.queryLatest("power"));
            voltage.text=qsTr("Voltage :"+myserver.queryLatest("voltage"));
            current.text=qsTr("Current :"+myserver.queryLatest("current"));
        }
        }

}
