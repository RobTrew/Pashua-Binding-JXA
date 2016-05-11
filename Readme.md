Overview
===========
This is a JavaScript for Automation (glue code) for using Carsten Blüm's [Pashua](http://www.bluem.net/jump/pashua) with JavaScript for Automation. Pashua is a Mac OS X application for using native GUI dialog windows in various programming languages.

This code can be found in a GitHub repository at https://github.com/RobTrew/Pashua-Binding-JXA. For examples in other programming languages, see https://github.com/BlueM/Pashua-Bindings.


Usage
======
This repository contains uncompiled JavaScript for Automation code. You can open any of:
- Example1ConfigTextJS.applescript
- Example2ConfigObjectJS.applescript
- Example3MixedJS.applescript

and run them in Script Editor, but they need a compiled version of “PashuaJS.applescript” (which is also in this folder) to be copied to ~/Library/Script Libraries/ as PashuaJS.scpt

One solution: simply open a Terminal window, run “compile.sh” (i.e. cd to the folder containing these files, then drag the icon of `compile.sh` onto the Terminal window and hit Return) and you’re done. You should now have:
- “Example1ConfigTextJS.scpt”
- “Example2ConfigObjectJS.scpt”
- “Example3MixedJS.applescript”

in the same folder, and “PashuaJS.scpt” in ~/Library/Script Libraries/ as “~/Library/Script Libraries/PashuaJS.scpt”

The first three scripts are examples of using Pashua to define, display and read the results of a custom dialog , while “~/Library/Script Libraries/PashuaJS.scpt” is the “library” for handling the communication with Pashua.

You will, of course, need Pashua.app on your Mac to run the example. The code expects Pashua.app in one of the “typical” locations, such as the global or the user’s “Applications” folder.


Compatibility
=============
This code has been tested on OSX 10.11 with Pashua 0.10.3


Authors
=========
This binding was written by Rob Trew.
Pashua is the work of Carsten Blüm.


License
=========
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

