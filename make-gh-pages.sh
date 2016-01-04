#1/bin/bash

DIR=$(pwd)

gitbook build

cd /tmp
git clone -b gh-pages git@github.com:RDI2/elf1-user-manual.git
cd elf1-user-manual
rsync -a $DIR/_book/ .
git add .
git commit -am "update gh-pages"
git push
cd ..
rm -rf elf1-user-manual
