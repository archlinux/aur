# Firejail profile for the Ghostery browser
# This file is overwritten after every install/update
# Persistent local customizations
include ghostery.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.cache/ghostery browser
noblacklist ${HOME}/.ghostery browser

mkdir ${HOME}/.cache/ghostery browser
mkdir ${HOME}/.ghostery browser
whitelist ${HOME}/.cache/ghostery browser
whitelist ${HOME}/.ghostery browser

# Redirect
include firefox-common.profile
