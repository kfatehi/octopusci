#!/bin/sh

# This script is design to provide a simple mechanism to help with automating
# the process of creating an account for gitosis to use on systems.

# The following are variables which are likely to change per installation.
USERNAME="octopusci"
USER_FULL_NAME="octopusci"
USER_UID=498 # this should be a number under 500 so it is a hidden account

# The following are variables unlikely to change but possibly could change
# per installation.
PRIMARY_GID=1000

# The following are variables which are highly unlikely to change and may
# only change for differences in the operating system.
USER_SHELL="/bin/bash"          # Mac OS X 10.5.6
LOC_DOMAIN="/Local/Default"     # Mac OS X 10.5.6
LOGIN_WIN_PREFS="/Library/Preferences/com.apple.loginwindow"

# Tell the system to automatically hide user accounts thate have a UID < 500
defaults write ${LOGIN_WIN_PREFS} Hide500Users -bool YES

# Create the user entry.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME}

# Set the users shell.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME} UserShell ${USER_SHELL}

# Set the users full name.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME} RealName "${USER_FULL_NAME}"

# Associate the user with a unique id.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME} UniqueID ${USER_UID}

# Associate the user with a primary gorup id.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME} PrimaryGroupID ${PRIMARY_GID}

# Create the users home directory.
dscl ${LOC_DOMAIN} -create /Users/${USERNAME} NFSHomeDirectory /Users/${USERNAME}

# Set the users password.
passwd ${USERNAME}

# Create the home directory and set the ownership properly.
mkdir -p /Users/#{USERNAME}
chown -R ${USER_UID}:${PRIMARY_GUID} /Users/${USERNAME}

