# Pub-Files
Assets directory = Image files for nudge

Configuration Files directory = Ready to go files for nudge

MDM Commands directory = Script to grab image assets (update screenshots, nice rainbow coloured apple logo, etc) and dump them in /tmp/. You can just copy and paste the script as a custom command in mosyle to grab images on user sign in.

You can choose to use either the nudge-macos.mobileconfig file which is entirely self contained and won't use anything from outside the mac itself, or nudge-macos-web.mobileconfig which will instead ping the com.github.macadmins.Nudge.json file for new info every 30 mins.

Config files are aligned to Essential 8. Meaning if there's a critical flaw being patched, you have 3 days to update. Otherwise you have 14 days.
