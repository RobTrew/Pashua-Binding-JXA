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

// THIS EXAMPLE USES the Pashua.writeConfig() function to generate Pashua config snippets
// from JavaScript objects or arrays of objects, interleaving these with the Pashua config text.

// Generating Pashua config text at run time may be useful, for example, for populating dialog option lists.

var Pashua = Library('PashuaJS');

var listA = ["alpha", "beta", "gamma"],
	listB = ["delta", "epsilon", "zeta"];

var strConfig = '# Set window title \n\
*.title = Welcome to Pashua \n\
\n' + Pashua.writeConfig({ // A single JS object, so the {} need not 
									   // be enclosed in [ array brackets ]
    "Comments": "Run-time info",
    "name": "inf",
    "type": "text",
    "default": "Dialog generated from a concatenation of Pashua Config text,\n\n" + new Date().toString() + "\n\nand in-line JavaScript for Automation objects.",
    "height": 276,
    "width": 310,
    "x": 340,
    "y": 270,
    "tooltip": "This is an element of type “text”"
  }) + '\n\
# Introductory text \n\
txt.type = text \n\
txt.default = Pashua is an application for generating dialog windows from programming languages which lack support for creating native GUIs on Mac OS X. Any information you enter in this example window will be returned to the calling script when you hit “OK”; if you decide to click “Cancel” or press “Esc” instead, no values will be returned.[return][return]This window shows nine of the UI element types that are available. You can find a full list of all GUI elements and their corresponding attributes in the documentation (➔ Help menu) that is included with Pashua. \n\
txt.height = 276 \n\
txt.width = 310 \n\
txt.x = 340 \n\
txt.y = 44 \n\
txt.tooltip = This is an element of type “text” \n\
 \n\
# Add a text field \n\
tf.type = textfield \n\
tf.label = Example textfield \n\
tf.default = Textfield content \n\
tf.width = 310 \n\
tf.tooltip = This is an element of type “textfield” \n\
 \n\
# Add a filesystem browser \n\
ob.type = openbrowser \n\
ob.label = Example filesystem browser (textfield + open panel) \n\
ob.width=310 \n\
ob.tooltip = This is an element of type “openbrowser” \n\
 \n' + Pashua.writeConfig([{  // Note that the two JS objects are grouped by [ array brackets ]
    "Comments": "Define radiobuttons",
    "name": "rb",
    "type": "radiobutton",
    "label": "Radio buttons from JavaScript array",
    "options": listA,
    "tooltip": "This is an element of type “radiobutton”"
  },
  {
    "Comments": "Add a popup menu",
    "name": "pop",
    "type": "popup",
    "label": "Popup menu from JavaScript array",
    "width": 310,
    "options": listB,
    "default": listB[0],
    "tooltip": "This is an element of type “popup”"
  }]) + '\n\
# Add 2 checkboxes \n\
chk.rely = -18 \n\
chk.type = checkbox \n\
chk.label = Pashua offers checkboxes, too \n\
chk.tooltip = This is an element of type “checkbox” \n\
chk.default = 1 \n\
chk2.type = checkbox \n\
chk2.label = But this one is disabled \n\
chk2.disabled = 1 \n\
chk2.tooltip = Another element of type “checkbox” \n\
 \n\
# Add a cancel button with default label \n\
cb.type = cancelbutton \n\
cb.tooltip = This is an element of type “cancelbutton” \n\
 \n\
db.type = defaultbutton \n\
db.tooltip = This is an element of type “defaultbutton” (which is automatically added to each window, if not included in the configuration) \n\
'

var a = Application.currentApplication(),
    sa = (a.includeStandardAdditions = true, a),
	
	// Import ~/Library/Script Libraries/PashuaJS.scpt
	Pashua = Library('PashuaJS'),  
	
	// Supply a dialog configuration,
	// and get results of user interaction
	dctResults = Pashua.showDialog(strConfig);

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