/*
 SPDX-FileCopyrightText: 2025 Kavinu Nethsara <kavinunethsarakoswattage@gmail.com>
 SPDX-License-Identifier: LGPL-2.1-or-later
 */

import QtQuick
import QtCore
import org.kde.kirigamiaddons.formcard as FormCard
import QtQuick.Dialogs as Dialogs

FormCard.FormCardPage {
    id: root
    anchors.fill: parent
    required property variant config

    FormCard.FormHeader {
        title: "General"
    }
    FormCard.FormCard {
        FormCard.FormSpinBoxDelegate {
            label: "Width"
            value: config.width
            from: 1
            to: 100
            stepSize: 1
            onValueChanged: {
                config.width = value
            }
        }
        FormCard.FormSpinBoxDelegate {
            label: "Height"
            value: config.height
            from: 1
            to: 100
            stepSize: 1
            onValueChanged: {
                config.height = value
            }
        }
        FormCard.FormSwitchDelegate {
            text: "Show week number"
            checked: config.showWeeks
            onCheckedChanged: {
                config.showWeeks = checked
            }
        }
    }

    FormCard.FormHeader {
        title: "Appearance"
    }

    FormCard.FormCard {
        FormCard.FormSwitchDelegate {
            id: showBackground
            text: "Show Background"
            checked: config.showBackground
            onCheckedChanged: {
                config.showBackground = checked
            }
        }
        FormCard.FormSwitchDelegate {
            text: "Rounded Corners"
            checked: config.roundedCorners
            onCheckedChanged: {
                config.roundedCorners = checked
            }
        }
        FormCard.FormSpinBoxDelegate {
            label: "Border width"
            value: config.borderWidth
            stepSize: 1
            from: 0
            to: 100
            onValueChanged: {
                config.borderWidth = value
            }
        }
        FormCard.FormSwitchDelegate {
            id: customBorderColor
            text: "Use custom colors"
            checked: config.useCustomBorder
            onCheckedChanged: {
                config.useCustomBorder = checked
            }
        }

        FormCard.FormColorDelegate {
            text: "Text and Border color"
            enabled: customBorderColor.checked
            color: config.borderColor
            onColorChanged: {
                config.borderColor = color.toString()
            }
        }
    }
}
