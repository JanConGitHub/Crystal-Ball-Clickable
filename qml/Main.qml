import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'crystalball.arc676'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    function getAnswer() {
        var index = parseInt(Math.random() * 12)
        switch (index) {
        case 0:
            return i18n.tr("Yes")
        case 1:
            return i18n.tr("No")
        case 2:
            return i18n.tr("Maybe")
        case 3:
            return i18n.tr("Try asking again later")
        case 4:
            return i18n.tr("Definitely")
        case 5:
            return i18n.tr("Of course not")
        case 6:
            return i18n.tr("Sure")
        case 7:
            return i18n.tr("Nope")
        case 8:
            return i18n.tr("Why not?")
        case 9:
            return i18n.tr("I wouldn't bet on it")
        case 10:
            return i18n.tr("You bet!")
        case 11:
            return i18n.tr("Don't hold your breath")
        }
    }

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Crystal Ball')
        }

        Label {
	    id: prompt
            anchors {
	    	top: header.bottom
		left: parent.left
	    }
            text: i18n.tr('Enter yes/no question')
        }

	TextField {
	    id: questionField
	    anchors {
	    	top: prompt.bottom
		horizontalCenter: parent.horizontalCenter
	    }
	    width: parent.width
	}

	Button {
	    id: askButton
	    anchors {
	    	top: questionField.bottom
		horizontalCenter: parent.horizontalCenter
	    }
	    text: i18n.tr('Ask question')
	    width: parent.width
	    onClicked: {
                var text = transcript.text
		text += "\nQ: " + questionField.text + "\nA: " + getAnswer()
		transcript.text = text
                questionField.text = ""
            }
	}

	
	Flickable {
            id: flickable
            height: 289
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.top: askButton.bottom
            anchors.topMargin: 2

            TextArea {
                id: transcript
                readOnly: true
                text: i18n.tr('Crystal Ball Transcript')
                anchors.fill: parent
                wrapMode: Text.WordWrap
                onTextChanged: {
                    if (transcript.height > flickable.height) {
                        flickable.contentY = transcript.height - flickable.height
                    }
                }
            }
        }

	Button {
	    id: clearButton
	    anchors {
	    	top: flickable.bottom
		horizontalCenter: parent.horizontalCenter
	    }
	    text: i18n.tr('Clear Transcript')
	    width: parent.width
	    onClicked: {
		transcript.text = i18n.tr('Crystal Ball Transcript')
	    }
	}

	Button {
	    id: aboutButton
	    anchors {
	    	top: clearButton.bottom
		horizontalCenter: parent.horizontalCenter
	    }
	    text: i18n.tr('About Crystal Ball')
	    width: parent.width
	}
    }
}
