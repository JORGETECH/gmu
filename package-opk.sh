#!/bin/bash

#Create the opkg directory
mkdir opkg

#Copy distribution files to the opkg directory for packaging
cp -R gmu-0.10.1-dingux/* opkg/

#Copy the desktop file to the opkg directory for GMenuNX
cp default.retrofw.desktop opkg/
cp default.gcw0.desktop opkg/

#Make the OPK file
mksquashfs opkg gmu-retrofw.opk -noappend -no-xattrs

#Cleanup
rm -rf opkg/
rm -rf gmu-0.10.1-dingux/

