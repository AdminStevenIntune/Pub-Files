#!/bin/bash
#set -x

############################################################################################
##
## Script to download Desktop Wallpaper
##
###########################################

## Copyright (c) 2020 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com

# Define variables
wallpaperurl="https://dictopsepprdprdsaep.blob.core.windows.net/nudge/appleRainbow.png"
wallpaperdir="/Library/Nudge"
wallpaperfile="appleRainbow.png"
log="/var/log/fetchNudgefile.log"

# start logging

exec 1>> $log 2>&1

echo ""
echo "##############################################################"
echo "# $(date) | Starting download of Immages"
echo "############################################################"
echo ""

##
## Checking if Wallpaper directory exists and create it if it's missing
##
if [ -d $wallpaperdir ]
then
    echo "$(date) | Wallpaper dir [$wallpaperdir] already exists"
else
    echo "$(date) | Creating [$wallpaperdir]"
    mkdir -p $wallpaperdir
fi


##
## Attempt to download the image file. No point checking if it already exists since we want to overwrite it anyway
##

echo "$(date) | Downloading Wallpaper from [$wallpaperurl] to [$wallpaperdir/$wallpaperfile]"
curl -L -o $wallpaperdir/$wallpaperfile $wallpaperurl
if [ "$?" = "0" ]; then
   echo "$(date) | Wallpaper [$wallpaperurl] downloaded to [$wallpaperdir/$wallpaperfile]"
   #killall Dock
   exit 0
else
   echo "$(date) | Failed to download wallpaper image from [$wallpaperurl]"
   exit 1
fi
