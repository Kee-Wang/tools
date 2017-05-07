#!/usr/bin/env bash
echo 'Here are the files with size greater than 50M'
find . -type f -size +50M
echo 'Control+C to discontinue the program or enter to proceed scyn'
read decision
git add *
git commit -m 'all added'
git push
