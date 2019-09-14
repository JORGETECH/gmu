#!/bin/bash

# Make folder structure for packaging
mkdir -p ipkg/home/retrofw/apps/gmu-retrofw

# Copy the files to the correct location for packaging
cp gmu-0.10.1-dingux/* ipkg/home/retrofw/apps/gmu-retrofw/

cd ipkg

# Create the two tar files and then create an IPK archive
tar -czvf control.tar.gz control
tar -czvf data.tar.gz home
ar rv gmu-retrofw.ipk control.tar.gz data.tar.gz debian-binary

cd ..

# Clean up after packaging
mv ipkg/gmu-retrofw.ipk ./
rm ipkg/control.tar.gz
rm ipkg/data.tar.gz
rm -rf ipkg/home/retrofw/apps/gmu-retrofw
