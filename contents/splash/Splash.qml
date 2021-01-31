import QtQuick 2.5
import QtGraphicalEffects 1.0

Image {
    id: root
    source: "images/Violet_Evergarden.png"
    fillMode: Image.PreserveAspectCrop
    
    property int stage

    onStageChanged: {
        if (stage == 1) {
            logoOpacityAnimation.from = 0;
            logoOpacityAnimation.to = 1;
            logoOpacityAnimation.running = true;
            preOpacityAnimation.from = 0;
            preOpacityAnimation.to = 1;
            preOpacityAnimation.running = true;
            contentOpacityAnimation.from = 0;
            contentOpacityAnimation.to = 1;
            contentOpacityAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }
        
        Image {
            id: logo
            property real size: units.gridUnit * 10
            anchors.centerIn: parent
            source: "images/Logo_VE1.png"
            sourceSize.width: 560
            sourceSize.height: 560
        }

        Image {
            id: logo2
            property real size: units.gridUnit * 10
            y: root.height - (root.height - logo.y) / 3.24 - height/2
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/Logo_VE2.png"
            sourceSize.width: 210
            sourceSize.height: 210

            ParallelAnimation {
                running: true

                ScaleAnimator {
                    target: logo2
                    from: 0
                    to: 1.03
                    duration: 700
                }

                SequentialAnimation {
                    loops: Animation.Infinite

                    ScaleAnimator {
                        target: logo2
                        from: 0.98
                        to: 1.03
                        duration: 1000
                    }
                    ScaleAnimator {
                        target: logo2
                        from: 1.03
                        to: 0.98
                        duration: 1000
                    }
                }
            }
        }
        
        Image {
            id: topRect
            y: root.height / 2
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0
            source: "images/rectangle.svg"
            sourceSize.height: size
            sourceSize.width: size
            Rectangle {
                y: parent.y - (parent.height / 0.7)
                radius: 0
                anchors.horizontalCenterOffset: 0
                color: "#ffffff"
                anchors {
//                     top: root.height
                    horizontalCenter: parent.horizontalCenter
                }
                height: 5.8
                width: root.width
                Rectangle {
                    id: topRectRectangle
                    radius: 0
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: (parent.width / 6) * (stage - 0.1)
                    color: "#8727d8"
                    Behavior on width {
                        PropertyAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }
        
    }
    
    OpacityAnimator {
        id: logoOpacityAnimation
        running: false
        target: logo
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
    
    OpacityAnimator {
        id: preOpacityAnimation
        running: false
        target: topRect
        from: 0
        to: 1
        duration: 3000
        easing.type: Easing.InOutQuad
    }
    
    OpacityAnimator {
        id: contentOpacityAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 3000
        easing.type: Easing.InOutQuad
    }

}
