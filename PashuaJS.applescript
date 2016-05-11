// Draft Pashua binding for JavaScript for Automation.

// ver 0.001
// Rob Trew Twitter: @complexpoint
//
// Runs a Pashua dialog, and returns the results as
// key-value bindings in a JavaScript dictionary object
//
// Usage: Use this file as a JavaScript for Automation Library
//        Saving it as ~/Library/Script Libraries/Pashua.scpt
//        And then referencing its methods in scripts as follows:
//
//              var Pashua = Library('PashuaJS');
//              Pashua.showDialog(config);
//
//        (NB You may need to restart Script Editor
//            before referencing newly saved Library files )
//        https://developer.apple.com/library/mac/releasenotes/
//          InterapplicationCommunication/RN-JavaScriptForAutomation/
//              Articles/OSX10-10.html#//apple_ref/doc/uid/TP40014508-CH109-SW14
// MAIN METHOD:
// showDialog :: String|Object -> maybe Path String -> JS Object
// Argument 1: Dialog/window configuration string in Pashua syntax
//             http://www.bluem.net/pashua-docs-latest.html
//             or as an equivalent JS array of objects
//             in which each dictionary object represents a widget,
//             and in which they key-value pairs use Pashua names and values
//               (see SERIALIZATION below)
// Argument 2: (Optional) path of folder containing Pashua.app;
//             if the the argument omitted, or an empty string,
//             default locations are searched for Pashua.app;
//
// Return value : JavaScript Object in which dialog element names
//                are bound to values entered by the user.

// showDialog :: String | Object -> maybe Path String -> () -> Object
function showDialog(config, customLocation) {
    'use strict';

    var a = Application.currentApplication(),
        sa = (a.includeStandardAdditions = true, a),
        fm = $.NSFileManager.defaultManager,

        strPashuaPath = locatePashua(customLocation),

        strConfig = (typeof config) === 'string' ? (
            config
        ) : writeConfig(config);

    if (strPashuaPath) {
        var strPosixTmpFile = sa.pathTo('temporary items') +
            '/' + sa.randomNumber()
            .toString()
            .substring(3),

            strResult = (
                $.NSString.alloc.initWithUTF8String(strConfig)
                .writeToFileAtomicallyEncodingError(
                    strPosixTmpFile,
                    true, $.NSUTF8StringEncoding, null
                ),
                sa.doShellScript(
                    '"' + strPashuaPath + '/Contents/MacOS/Pashua' +
                    '" "' + strPosixTmpFile + '"'
                )
            );

        // Housekeeping - clear temporary file
        fm.removeItemAtPathError(
            ObjC.unwrap($(strPosixTmpFile)
                .stringByStandardizingPath),
            null
        );

        // key:value bindings returned as JavaScript object
        return strResult.split(/[\n\r]+/)
            .reduce(function (a, strLine) {
                var s = strLine.trim();
                if (s) {
                    var lst = s.split('=');
                    if (lst.length > 1) {
                        a[lst[0]] = lst.slice(1)
                            .join('=');
                    }
                }
                return a;
            }, {});
    }
}

// Path of Pashua.app

// locatePashua :: maybe String -> maybe String
function locatePashua(strCustomPath) {

    var a = Application.currentApplication(),
        sa = (a.includeStandardAdditions = true, a),
        fm = $.NSFileManager.defaultManager,

        strPathToMe = sa.pathTo(this)
        .toString(),

        // Search paths
        lstPaths = [
            (strCustomPath && strCustomPath.trim()) || '', // in custom path ?
            strPathToMe + '/Contents/Resources/MacOS/', // in this bundle ?
            strPathToMe.split('/') // in same folder ?
            .slice(0, -1)
            .join('/')
        ].concat(['user', 'system'].map(function (str) { //  Applications?
            return sa.pathTo('applications folder', {
                    from: str + ' domain'
                })
                .toString();
        })),

        // First location at which Pashua is found (else undefined)
        maybePath = lstPaths
        .reduce(function (a, p) {
                if (a) return a;
                if (p) {
                    var strPath = (p.slice(-1) !== '/' ? (
                            p + '/'
                        ) : p) + 'Pashua.app',
                        error = $();

                    // File exists at path (allowing for ~ expansion) ?
                    fm.attributesOfItemAtPathError(
                        ObjC.unwrap($(strPath)
                            .stringByStandardizingPath),
                        error
                    );
                    if (error.code === undefined) return strPath;
                }
            },
            undefined
        );


    // Path found or failure message
    return (maybePath) ? maybePath : (
        sa.activate(),
        sa.displayDialog('Pashua.app not located in any of these paths:\n' +
            lstPaths.join('\n- '), {
                withTitle: 'Pashua binding for JavaScript for Automation'
            })
    );
}


// SERIALISATION
// Translate a JavaScript array of objects to a Pashua config text
// For run-time adjustment of details like option lists

// The function below is used by showDialog if it detects that its
// first argument (config) is not a string

// EACH JS OBJECT IN THE ARRAY SHOULD HAVE AT LEAST:
//    a 'name' property (Pashua element name, or '*' for Window)
//  a 'type' property (one of the Pashua element type names)

// AND CAN HAVE:
//  any other properties with names which are:
//  - Either Pashua attributes, OR
//  - The special key 'options' followed by an array of Strings or Numbers.
//
//      (Options are handled this way partly for convenience,
//         and partly because JavaScript objects can not contain duplicate keys)

// [
//   {
//     "Comments": "Set window title",
//     "name": "*",
//     "title": "Welcome to Pashua"
//   },
//   {
//     "Comments": "Add a filesystem browser",
//     "name": "ob",
//     "type": "openbrowser",
//     "label": "Example filesystem browser (textfield + open panel)",
//     "width": 310,
//     "tooltip": "This is an element of type ÒopenbrowserÓ"
//   },
//   {
//     "Comments": "Define radiobuttons",
//     "name": "rb",
//     "type": "radiobutton",
//     "label": "Example radiobuttons",
//     "options": [
//       "Radiobutton item #1",
//       "Radiobutton item #2",
//       "Radiobutton item #3"
//     ],
//     "tooltip": "This is an element of type ÒradiobuttonÓ"
//   },
//   {
//     "Comments": "Add a popup menu",
//     "name": "pop",
//     "type": "popup",
//     "label": "Example popup menu",
//     "width": 310,
//     "options": [
//       "Popup menu item #1",
//       "Popup menu item #2",
//       "Popup menu item #3"
//     ],
//     "default": "Popup menu item #2",
//     "tooltip": "This is an element of type ÒpopupÓ"
//   }
// ]
// 

//  The values given for each attribute may be:
//      - Strings
//        - Numbers
//        - In the case of an 'options' key, an Array of Strings|Numbers

// Comments can either be simple JavaScript comments (not serialized)
// or key value pairs in which the key is '#' (must be quoted for JS)
// or 'Comments' | 'comments'

// writeConfig :: [{name:String, type:String, ... }] -> String
function writeConfig(jsObject) {
    var rgxLines = /[\n\r]+/,
        rgxReturn = /[\n\r]/gm; // -> '[return]',
		lstElements = jsObject instanceof Array ? jsObject : [jsObject];

    return lstElements
        .reduce(function (a, dct, i) {
            var name = dct.name,
                nameDot = dct.name + '.';

            if (name.length) {
                // Blank space before start of each element except first
                return a + (i ? '\n\n' : '') + Object.keys(dct)
                    .reduce(function (lstLines, k) {
                        var value = dct[k];

                        if (k !== 'options') {
                            // Split comments to lines, prefixing with #
                            if (['#', 'comment', 'comments']
                                .indexOf(k.toLowerCase()) !== -1) {
                                lstLines.push(
                                    value
                                    .split(rgxLines)
                                    .map(function (x) {
                                        return '# ' + x;
                                    })
                                    .join('\n')
                                );
                            } else {
                                // key-value pair with '[return]' -> \n
                                // for string values
                                if (k !== 'name') {
                                    lstLines.push(
                                        nameDot + k + ' = ' + (
                                            'string' === typeof value ?
                                            value.replace(
                                                rgxReturn, '[return]'
                                            ) : value
                                        )
                                    );
                                }
                            }
                        // Rewrite 'options' array to n * 'option' lines
                        } else {
                            lstLines.push(
                                dct['options']
                                .map(function (opt) {
                                    return nameDot + 'option = ' + opt;
                                })
                                .join('\n')
                            );
                        }

                        return lstLines;
                    }, [])
                    .join('\n');
            } else return a;
        }, '');
}


// Utility function - generate JSO version of Pashua config text
// Useful for testing round tripping with writeConfig

// readConfig :: String -> [Object]
function readConfig(strConfig) {

    var rgxKeyVal = /([\w\*]+).(\w+)\s*=\s*(.*)/,
        dctParse = strConfig
        .replace(/\\[\n\r]+/mg, ' ') // REJOIN CONTINUATION LINES
        .split(/[\n\r]+/)
        .reduce(function (a, x, i, l) {
            var strLine = x.trim();

            if (strLine) { // IGNORE BLANK LINKS
                if (strLine.charAt(0) !== '#') { // COMMENTS
                    var lst = rgxKeyVal.exec(strLine);

                    // GET ELEMENT, ATTRIBUTE, VALUE
                    if (lst && lst.length > 3) {
                        var strElem = lst[1],
                            strAttrib = lst[2],
                            strVal = lst[3].trim(),
                            varVal = (
                                isNaN(strVal) ? strVal.replace(
                                    /\[return\]/g, '\n') :
                                parseInt(strVal, 10)
                            );

                        // START OF NEW ELEMENT ?
                        if (strElem !== a.name) {
                            // Push the completed element into
                            // the sequence
                            if (Object.keys(a.element)
                                .length) {
                                a.dialog.push(a.element);

                                // AND START A NEW ELEMENT
                                // (inheriting any accumulated comments)
                                if (a.comments.length) {
                                    a.element = {
                                        'comments': a.comments
                                            .join('\n')
                                    };
                                } else a.element = {};
                            } else {
                                a.element.comments = a.comments
                                    .join('\n')
                            }
                            a.comments = [];
                            a.name = strElem;
                            a.element.name = strElem;
                        }

                        if (strAttrib !== 'option') {
                            a.element[strAttrib] = varVal;
                        } else {
                            if (a.element.options instanceof Array) {
                                a.element.options.push(varVal);
                            } else a.element.options = [varVal];
                        }
                    }
                } else { // COMMENT LINES ARE PUSHED ONTO A STACK UNTIL
                    // THE START OF A NEW WINDOW OR ELEMENT
                    a.comments.push(
                        strLine.substr(1)
                        .trim()
                    );
                }
            }
            return a;
        }, {
            name: '',
            element: {},
            comments: [],
            dialog: []
        });

    return dctParse.dialog.concat(dctParse.element);
}