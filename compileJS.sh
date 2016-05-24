#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -e "$HOME/Library/Script Libraries" ]
then
	mkdir "$HOME/Library/Script Libraries"
fi

if [ ! -d "$HOME/Library/Script Libraries" ]
then
	>&2 echo "Not a directory: $HOME/Library/Script Libraries"
	exit 1
fi

osacompile -l JavaScript -o "$HOME/Library/Script Libraries/PashuaJS.scpt"  "$DIR/PashuaJS.applescript"
osacompile -l JavaScript -o "Example1ConfigTextJS.scpt" "$DIR/Example1ConfigTextJS.applescript"
osacompile -l JavaScript -o "Example2ConfigObjectJS.scpt" "$DIR/Example2ConfigObjectJS.applescript"
osacompile -l JavaScript -o "Example3ConfigMixedJS.scpt" "$DIR/Example3ConfigMixedJS.applescript"
echo ".scpt files compiled"
