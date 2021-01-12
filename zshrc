#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=/usr/lib/zim

# Output is suppressed in the commands below to prevent spewing out permission errors
# caused when zim tries to upgrade itself when ran as user w/o writing rights to $ZIM_HOME.
# Source global config
source ${ZIM_HOME}/templates/zshrc &>/dev/null

# Source zim
source ${ZIM_HOME}/init.zsh &>/dev/null

