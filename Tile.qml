/*
 SPDX-FileCopyrightText: 2025 Kavinu Nethsara <kavinunethsarakoswattage@gmail.com>
 SPDX-License-Identifier: LGPL-2.1-or-later
*/

import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasma5support 2.0 as P5Support
import org.kde.plasma.workspace.calendar 2.0

Item {
    id: root
    anchors.fill: parent
    anchors.margins: Kirigami.Units.smallSpacing

    required property var metadata
    required property Tile container

    P5Support.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 60000
        intervalAlignment: P5Support.Types.AlignToMinute
    }


    Rectangle {
        id: background
        anchors.fill: parent

        radius: root.metadata.roundedCorners ? Kirigami.Units.mediumSpacing : 0
        color: root.metadata.showBackground ? Kirigami.Theme.backgroundColor : "transparent"

        border.width: root.metadata.borderWidth
        border.color: root.metadata.useCustomBorder ? root.metadata.borderColor : Kirigami.Theme.textColor
    }

    MonthView {
        Kirigami.Theme.inherit: false
        Kirigami.Theme.textColor: root.metadata.borderColor

        id: calendar
        today: dataSource.data["Local"]["DateTime"]
        showWeekNumbers: root.metadata.showWeeks

        anchors.fill: parent
        anchors.margins: Kirigami.Units.smallSpacing + background.border.width
    }
}
