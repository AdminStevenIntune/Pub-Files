#!/bin/zsh

# Support App Extension - Device Serial
#
#
# Copyright 2022 Root3 B.V. All rights reserved.
#
# Support App Extension to get the current Device Serial Number and publish to
# Extension B.
#
# REQUIREMENTS:
# - Jamf Pro Binary
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
# EVENT SHALL THE PUBLISHER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# ---------------------    do not edit below this line    ----------------------

# Support App preference plist
preference_file_location="/Library/Preferences/nl.root3.support.plist"

# Start spinning indicator
defaults write "${preference_file_location}" ExtensionLoadingB -bool true

# Replace value with placeholder while loading
defaults write "${preference_file_location}" ExtensionValueB -string "Not Found"

# Keep loading effect active for 0.5 seconds
sleep 0.5

# Get the anydesk alias
device_serial=$(ioreg -l | grep IOPlatformSerialNumber | awk -F"\"" '{print $4}')

# Write output to Support App preference plist
defaults write "${preference_file_location}" ExtensionValueB -string "${device_serial}"

# Stop spinning indicator
defaults write "${preference_file_location}" ExtensionLoadingB -bool false