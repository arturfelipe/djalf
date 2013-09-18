#!/bin/bash

current=`python setup.py -V`

echo "Type the new version (current $current):"
read version

[[ -z $version ]] && echo 'Empty version, exiting...' && exit 1

sed -i '' -E "s/version='.+'/version='0.2'/" setup.py

git ci $txt -m "Bump to $version"
git tag $version
git push
git push --tags

echo "Commits between $version e $current:"
git log $version...$current --format='%Cgreen%h %Cred%cr %Creset%s %Cblue%cn%Cgreen%d'
