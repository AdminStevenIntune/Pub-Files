#!/bin/zsh

# Support App Extension - Anydesk Alias
#
#
# Copyright 2022 Root3 B.V. All rights reserved.
#
# Support App Extension to get the current AnyDesk alias and publish to
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
anydesk_alias=$(grep -E 'ad.anynet.alias' "/private/etc/anydesk_ad_e9d6a745/system.conf" | awk -F"ad.anynet.alias=" '{print $2}')

# Write output to Support App preference plist
defaults write "${preference_file_location}" ExtensionValueB -string "${anydesk_alias}"

# Stop spinning indicator
defaults write "${preference_file_location}" ExtensionLoadingB -bool false