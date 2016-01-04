#1/bin/bash

DIR=$(pwd)

gitbook build

cd /tmp
git clone git@github.com:RDI2/elf1-user-manual.git
cd elf1-user-manual
git checkout gh-pages
rsync -a $DIR/_book/ .

