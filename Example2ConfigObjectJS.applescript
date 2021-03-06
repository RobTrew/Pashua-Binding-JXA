// This example loads script "PashuaJS.scpt" (to be compiled from "PashuaJS.applescript") from
//
//		~/Library/Script Libraries/
//
//		To view this folder, choose the Finder's Go menu, hold down the option key, and choose Library
//		then browse to the Script Libraries folder
//
//		See the section on Library in Apple's JavaScript for Automation Release Notes (10.10 section)
//		https://developer.apple.com/library/mac/releasenotes/InterapplicationCommunication/RN-JavaScriptForAutomation
//
// PashuaJS.scpt handles the communication with Pashua.app which, for this test  should be
// in a system or user Applications folder
// You can either take the handlers out of Pashua.scpt and use them inline whenever you write
// a script which uses Pashua, use PashuaJS.scpt as a JavaScript for Automation Library (OS X 10.10 or newer)
// or use the `var Pashua = Library('PashuaJS')` approach used in this file.

var objConfig = [
  {
    "Comments": "Set window title",
    "name": "*",
    "title": "Welcome to Pashua"
  },
  {
    "Comments": "Introductory text",
    "name": "txt",
    "type": "text",
    "default": "Pashua is an application for generating dialog windows from programming languages which lack support for creating native GUIs on Mac OS X. Any information you enter in this example window will be returned to the calling script when you hit “OK”; if you decide to click “Cancel” or press “Esc” instead, no values will be returned.\n\nThis window shows nine of the UI element types that are available. You can find a full list of all GUI elements and their corresponding attributes in the documentation (➔ Help menu) that is included with Pashua.",
    "height": 276,
    "width": 310,
    "x": 340,
    "y": 44,
    "tooltip": "This is an element of type “text”"
  },
  {
    "Comments": "Add a text field",
    "name": "tf",
    "type": "textfield",
    "label": "Example textfield",
    "default": "Textfield content",
    "width": 310,
    "tooltip": "This is an element of type “textfield”"
  },
  {
    "Comments": "Add a filesystem browser",
    "name": "ob",
    "type": "openbrowser",
    "label": "Example filesystem browser (textfield + open panel)",
    "width": 310,
    "tooltip": "This is an element of type “openbrowser”"
  },
  {
    "Comments": "Define radiobuttons",
    "name": "rb",
    "type": "radiobutton",
    "label": "Example radiobuttons",
    "options": [
      "Radiobutton item #1",
      "Radiobutton item #2",
      "Radiobutton item #3"
    ],
    "tooltip": "This is an element of type “radiobutton”"
  },
  {
    "Comments": "Add a popup menu",
    "name": "pop",
    "type": "popup",
    "label": "Example popup menu",
    "width": 310,
    "options": [
      "Popup menu item #1",
      "Popup menu item #2",
      "Popup menu item #3"
    ],
    "default": "Popup menu item #2",
    "tooltip": "This is an element of type “popup”"
  },
  {
    "Comments": "Add 2 checkboxes",
    "name": "chk",
    "rely": -18,
    "type": "checkbox",
    "label": "Pashua offers checkboxes, too",
    "tooltip": "This is an element of type “checkbox”",
    "default": 1
  },
  {
    "name": "chk2",
    "type": "checkbox",
    "label": "But this one is disabled",
    "disabled": 1,
    "tooltip": "Another element of type “checkbox”"
  },
  {
    "Comments": "Add a cancel button with default label",
    "name": "cb",
    "type": "cancelbutton",
    "tooltip": "This is an element of type “cancelbutton”"
  },
  {
    "name": "db",
    "type": "defaultbutton",
    "tooltip": "This is an element of type “defaultbutton” (which is automatically added to each window, if not included in the configuration)"
  }
]

var a = Application.currentApplication(),
    sa = (a.includeStandardAdditions = true, a),
	
	// Import ~/Library/Script Libraries/PashuaJS.scpt
	Pashua = Library('PashuaJS'),  
	
	// Supply a dialog configuration,
	// and get results of user interaction
	dctResults = Pashua.showDialog(objConfig);

sa.activate();
sa.displayDialog(
    'JavaScript for Automation received the following key:value\n' +
    'results from a Pashua.app dialog:\n\n' +
    JSON.stringify(
        dctResults,
        null, 2
    ), {
        buttons: ['OK'],
        defaultButton: 'OK',
        withTitle: 'Pashua binding for JavaScript for Automation'
    }
);

dctResults;