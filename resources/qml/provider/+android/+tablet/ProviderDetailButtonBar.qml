import QtQuick 2.6

import "../global"

Item {
	id: baseItem

	height: button.height + Constants.component_spacing
	width: parent.width

	property string selectedCategory: ""
	property string providerIcon: ""
	property string address: ""
	property color titleBarColor

	Image {
		id: icon
		source: baseItem.providerIcon !== "" ? baseItem.providerIcon :
				Category.buttonImageSource(baseItem.selectedCategory)
		asynchronous: true
		height: 2 * baseItem.height
		width: height
		fillMode: Image.PreserveAspectFit
		anchors.left: parent.left
		anchors.leftMargin: Constants.component_spacing
		anchors.verticalCenter: baseItem.top
	}

	Button {
		id: button
		text: qsTr("ONLINE APPLICATION")
		buttonColor: baseItem.titleBarColor
		anchors.left: icon.right
		anchors.leftMargin: Constants.component_spacing
		anchors.bottom: icon.bottom
		enabled: baseItem.address !== ""

		onClicked: {
			if (baseItem.address !== "") {
				Qt.openUrlExternally(baseItem.address)
			}
		}
	}
}