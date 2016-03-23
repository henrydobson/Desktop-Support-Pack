#!/bin/bash

# Remove the old icons if they exist
if [ -e ~/Desktop/Email\ Support ]
    then
    rm -f ~/Desktop/Email\ Support
fi

if [ -e ~/Desktop/Help\ Center.webloc ]
    then
    rm -f ~/Desktop/Help\ Center.webloc
fi

/bin/cp /Library/Management/desktopSupportPack/Email\ Support ~/Desktop/Email\ Support
/bin/cp /Library/Management/desktopSupportPack/Help\ Center.webloc ~/Desktop/Help\ Center.webloc

MSERIAL=`system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'`
/usr/libexec/PlistBuddy -c "Set :URL mailto:example@yourhelpdesk.com?&amp;body=%0a%0aThe%20lines%20below%20is%20to%20assist%20your%20IT%20department.%20Please%20do%20not%20delete.%0aSerial%20number:%20$MSERIAL" ~/Desktop/Email\ Support

EMAILSUPPORT() {
/usr/local/bin/dockutil --add ~/Desktop/Email\ Support --no-restart
}
HELPCENTER() {
/usr/local/bin/dockutil --add ~/Desktop/Help\ Center.webloc
}

# add to dock
EMAILSUPPORT
HELPCENTER
