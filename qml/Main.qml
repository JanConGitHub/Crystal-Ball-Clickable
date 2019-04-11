//Copyright (C) 2018-9 Arc676/Alessandro Vinciguerra <alesvinciguerra@gmail.com>

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.

import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
	id: mainView
	header: DefaultHeader {}

	anchors.fill: parent

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
				topMargin: margin
				left: parent.left
				leftMargin: margin
			}
			text: i18n.tr('Enter yes/no question')
		}

		TextField {
			id: questionField
			anchors {
				top: prompt.bottom
				topMargin: margin
				leftMargin: margin
				rightMargin: margin
				horizontalCenter: parent.horizontalCenter
			}
			width: parent.width - 2 * margin
		}

		Button {
			id: askButton
			anchors {
				top: questionField.bottom
				topMargin: margin
				leftMargin: margin
				rightMargin: margin
				horizontalCenter: parent.horizontalCenter
			}
			width: parent.width - 2 * margin
			text: i18n.tr('Ask question')
			onClicked: {
				transcript.append("Q: " + questionField.text + "\nA: " + getAnswer())
				questionField.text = ""
			}
		}


		Flickable {
			id: flickable
			anchors {
				top: askButton.bottom
				topMargin: margin
				left: parent.left
				leftMargin: margin
				right: parent.right
				rightMargin: margin
				bottom: clearButton.top
				bottomMargin: margin
			}

			TextArea {
				id: transcript
				readOnly: true
				anchors.fill: parent
				text: i18n.tr('Crystal Ball Transcript')
				wrapMode: Text.WordWrap
			}
		}

		Button {
			id: clearButton
			anchors {
				bottom: parent.bottom
				bottomMargin: margin
				leftMargin: margin
				rightMargin: margin
				horizontalCenter: parent.horizontalCenter
			}
			width: parent.width - 2 * margin
			text: i18n.tr('Clear Transcript')
			onClicked: {
				transcript.text = i18n.tr('Crystal Ball Transcript')
			}
		}
	}
}
