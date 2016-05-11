#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
osacompile -l JavaScript -o "$HOME/Library/Script Libraries/PashuaJS.scpt"  "$DIR/PashuaJS.applescript"
osacompile -l JavaScript -o "Example1ConfigTextJS.scpt" "$DIR/Example1ConfigTextJS.applescript"
osacompile -l JavaScript -o "Example2ConfigObjectJS.scpt" "$DIR/Example2ConfigObjectJS.applescript"
osacompile -l JavaScript -o "Example3MixedJS.scpt" "$DIR/Example3ConfigMixedJS.applescript"
echo ".scpt files compiled"