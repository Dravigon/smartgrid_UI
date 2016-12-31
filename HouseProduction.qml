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
    onVisibleChanged: addSeries()

    ColumnLayout {
        id: columnLayout
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

        Label {
            id: label
            text: qsTr("Label")
        }
    }

    function addSeries()
    {
        //Define Axes of the ChartView
        //myserver.getAxisYDescription(yDescription);
//        myserver.getAxisXTime();
        console.log(xTime.min)
        //myserver.getAxisYValues(yValues);

        // Create new LineSeries with 3 Axes (Two-Y-Axis, One-X-Axis)
        var mySeries = energyChart.createSeries(ChartView.SeriesTypeLine, "Line", myserver.getAxisXTime(), yValues);
       // var mySeries2 = energyChart.createSeries(ChartView.SeriesTypeLine, "Overview", xTime, yDescription);

        // Define series on specific wishes
        myserver.setLineSeries(mySeries);

        //Delete not needed series (only created because second y-Axis
       // energyChart.removeSeries(mySeries2);
    }


    Button{
        x: 8
        y: 8
        width: 78
        height: 48
        text: "back"
        onClicked: backclicked()
    }
}
