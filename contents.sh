### DO NOT USE THIS FILE IS JUST A DUMPING GROUND OF STUFF ###

[github file = "/macmule/dumpinggound/blob/master/contents.sh" start_line = "" end_line = ""]

#!/bin/bash
 
#Backup the original authorization file
/bin/cp /etc/authorization /etc/authorization.original.backup
 
#Modify /etc/authorization to allow any member of the everyone group access to unlock preferences
/usr/libexec/PlistBuddy -c "Set :rights:system.preferences:group everyone" /etc/authorization
/usr/libexec/PlistBuddy -c "Set :rights:system.preferences:shared true" /etc/authorization
 
SQLCMD
use UTS
GO
UPDATE font__font_clientSettings SET font_clientsettings_replication_policy = 'all' WHERE font_clientsettings_replication_policy = 'on-demand-local-cache';
UPDATE font__font_clientSettings SET font_clientsettings_has_personal_workgroup = 'T';
UPDATE font__font_clientSettings SET font_clientsettings_personal_workgroup_is_local = 'T';
UPDATE font__font_permissions SET font_permissions_canactivateacrossworkgroups = 'T';
GO

#!/bin/bash

#Backup the original authorization file
sudo cp /etc/authorization /etc/authorization.bak

#Modify /etc/authorization to create a kerberos ticket at login
sudo /usr/libexec/PlistBuddy -c "Add :rights:system.login.console:mechanisms:11 string "builtin:krb5store,privileged"" /etc/authorization

# Backup the original swupd.plist
sudo cp /etc/swupd/swupd.plist /etc/swupd/swupd.plist.bak

# Change the MetaIndexURL to point to your own SUS (replace swupdate.example.com with your SUS's FQDN).
sudo /usr/libexec/PlistBuddy -c 'set metaIndexURL http://swupdate.example.com:8088/catalogs.sucatalog' /etc/swupd/swupd.plist

sudo rm -rf /private/etc/swupd/com.apple.server.swupdate.plist
sudo rm -rf /private/etc/swupd/com.apple.server.swupdate.plist.previous
sudo rm -rf /private/var/db/swupd/html/content/downloads/*

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
      <key>PrimaryCatalog</key>
      <string>http://swupdate.example.com/content/catalogs/index.sucatalog</string>
      <key>CatalogsList</key>
      <array>
            <string>http://swupdate.example.com/content/catalogs/index.sucatalog</string>
            <string>http://swupdate.example.com/content/catalogs/others/index-leopard.merged-1.sucatalog</string>
            <string>http://swupdate.example.com/content/catalogs/others/index-leopard-snowleopard.merged-1.sucatalog</string>
      </array>
</dict>

sudo /usr/libexec/PlistBuddy -c 'set metaIndexURL http://swupdate.example.com:8088/content/meta/mirror-config-1.plist' /etc/swupd/swupd.plist

ln -s /usr/share/swupd/html/content/catalogs/index.sucatalog
ln -s /usr/share/swupd/html/content/catalogs/others/index-leopard.merged-1.sucatalog
ln -s /usr/share/swupd/html/content/catalogs/others/index-leopard-snowleopard.merged-1.sucatalog

<VirtualHost jss.mycompany.com:80>
	Redirect 301 / http://jss.mycompany.com:9006
</VirtualHost>

defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool true

sudo languagesetup

sudo languagesetup –langspec French

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences AppleLocale "en_GB"

/usr/bin/defaults write /Library/Preferences/.GlobalPreferences Country "en_GB"

/usr/bin/defaults write -g AppleLanguages "(en, ja, fr, de, es, it, nl, sv, nb, da, fi, pt, zh-Hans, zh-Hant, ko)"

defaults write /Library/ScriptingAdditions/Adobe\ Unit\ Types.osax/Contents/Info CFBundleVersion 2.1.0

sudo dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin

sudo dsconfigad -useuncpath disable

sudo nano /private/etc/apache2/httpd.conf

Include /private/etc/apache2/extra/httpd-vhosts.conf

sudo nano  /private/etc/apache2/extra/httpd-vhosts.conf

sudo serveradmin command web:command=restoreFactorySettings

sudo ln -s /Shared\ Items/CasperShare /private/var/empty

LABEL=Users\040HD /Users hfs rw

#!/bin/sh

# Gets the UUID of the Partition "Users HD"
usersUUID=`diskutil info Users\ HD | grep Volume\ UUID: | awk '{print $3}'`

# Echo UUID
echo "Users HD UUID is $usersUUID..."

# Empty the FSTAB file, just leaving the UUID mountpoint
echo > $1/private/etc/fstab "UUID=$usersUUID /Users hfs rw"

# Echo we've completed
echo "Created FSTAB at $1/private/etc..."

# Correct owner
chown root $1/private/etc/fstab

# Correct permissions
chmod 755 $1/private/etc/fstab

# Echo that we've corrected permissions
echo "Repaired FSTAB permissions..."

defaults write com.apple.Safari  com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool true

defaults write com.apple.Safari ExtensionsEnabled -bool YES

if ADGroups contains "<insert_printer_name>" then
     if installedPrinters does not contain "<insert_printer_name>" then 
          try
               do shell script "/usr/sbin/lpadmin -p <insert_printer_name> -E -v lpd://<insert_printer_name>.macmule.com -P /Library/Printers/PPDs/Contents/Resources/en.lproj/Canon\\ iR-ADV\\ C5200s-B2\\ PS\\ V1.0 -o printer-is-shared=false -o EFDuplex=False" 
     on error 
               do shell script "/usr/sbin/lpadmin -p <insert_printer_name> -E -v lpd://<insert_printer_name>.macmule.com -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd -o printer-is-shared=false" 
          end try 
     end if 
end if

lpoptions -p <insert_printer_name> -l
