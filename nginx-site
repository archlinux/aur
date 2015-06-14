#!/bin/bash - 
#===============================================================================
#
#          FILE: nginx-site
# 
#   DESCRIPTION: Script for adding/disabling sites on nginx, based
#               on script from http://catap.ru/debian-catap/
# 
#        AUTHOR: Piotr Rogoża (piecia), rogoza dot piotr at gmail dot com
#  ORGANIZATION: dracoRP
#===============================================================================

CONFIGFILE='/etc/conf.d/nginx-site.conf'
#{{{ ENV
SYSCONFDIR='/etc/nginx'
EXTSITE='.conf'
SITESAVAILABLE="sites-available"
SITESENABLED="sites-enabled"
RELOADSERVICE='no'
if [ -r "$CONFIGFILE" ]; then
    source $CONFIGFILE
fi
# else use default options
#}}}
### Don't modify below the line.
PROGRAMNAME=$(basename $0)
PROGENABLE=nginx-ensite
PROGDISABLE=nginx-dissite
# Help, Version
OPTIONS='hv'
VERSION=0.1
#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------
enable_site (){ #{{{
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  enable_site
#   DESCRIPTION:  enable site
#    PARAMETERS:  site priority
#       RETURNS:  -
#-------------------------------------------------------------------------------
    if [ -z "$1" ]; then
        echo "Which site would you like to enable?"
        echo -n "Your choices are: "
        ls $SYSCONFDIR/$SITESAVAILABLE/*$EXTSITE 2>/dev/null | \
        sed -e "s,$SYSCONFDIR/$SITESAVAILABLE/,,g" -e "s,$EXTSITE,,g" | xargs echo
        echo -n "Site name? "
        read SITENAME
    else
        SITENAME=$1
    fi

    if [ -z "$SITENAME" ]; then
        echo "No site has been selected."
        exit
    fi

#    if [ "$SITENAME" = "default" ]; then
#        PRIORITY="000"
#    fi
    
#    if [ -z "$2" ]; then
#        echo -n "Enter the priority for the site:"
#        read PRIORITY
#    fi
    if [ -n "$2" ]; then
        PRIORITY="$2"
    fi

    if [ -e "$SYSCONFDIR/$SITESENABLED/$SITENAME$EXTSITE" -o \
        -e "$SYSCONFDIR/$SITESENABLED/$PRIORITY-$SITENAME" ]; then
        echo "This site is already enabled!"
        exit 0
    fi

    if ! [ -e "$SYSCONFDIR/$SITESAVAILABLE/$SITENAME$EXTSITE" ]; then
        echo "This site does not exist!" >&2
        exit 1
    fi

    if [ "$SITENAME" = "default" ]; then
        ln -sf $SYSCONFDIR/$SITESAVAILABLE/$SITENAME$EXTSITE \
            $SYSCONFDIR/$SITESENABLED/${PRIORITY:+$PRIORITY-}$SITENAME$EXTSITE
        RETVAL=$?
    else
        ln -sf $SYSCONFDIR/$SITESAVAILABLE/$SITENAME$EXTSITE \
            $SYSCONFDIR/$SITESENABLED/$SITENAME$EXTSITE
        RETVAL=$?
    fi

    if [ $RETVAL -eq 0 ]; then
        echo "Site '${PRIORITY:+$PRIORITY-}$SITENAME' installed; run 'systemctl reload nginx' to enable."
        return 0
    else
        echo "Site '${PRIORITY:+$PRIORITY-}$SITENAME' is not installed."
        return 1
    fi
} # ----------  end of function enable_site  ----------}}}
disable_site (){ #{{{
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  disable_site
#   DESCRIPTION:  disable site
#    PARAMETERS:  site
#       RETURNS:  -
#-------------------------------------------------------------------------------
    if [ -z "$1" ]; then
        echo "Which site would you like to disable?"
        echo -n "Your choices are: "
        ls $SYSCONFDIR/$SITESENABLED/*$EXTSITE 2>/dev/null| \
        sed -e "s,$SYSCONFDIR/$SITESENABLED/,,g" -e "s,$EXTSITE,,g" | xargs echo
        echo -n "Site name? "
        read SITENAME
    else
        SITENAME=$1
    fi

    if [ -z "$SITENAME" ]; then
        echo "No site has been selected."
        exit
    fi

#    if [ -z "$2" ]; then
#        echo -n "Enter the priority for the site:"
#        read PRIORITY
#    fi
    if [ -n "$2" ]; then
        PRIORITY="$2"
    fi

    if ! [ -e "$SYSCONFDIR/$SITESENABLED/$SITENAME$EXTSITE" -o \
        -e "$SYSCONFDIR/$SITESENABLED/$PRIORITY-$SITENAME$EXTSITE" ]; then
        if [ -e "$SYSCONFDIR/$SITESAVAILABLE/$SITENAME$EXTSITE" ]; then
            echo "Site $SITENAME is already disabled"
            exit 0
        fi
        echo "Site $SITENAME does not exist!" >&2
        exit 1
    fi

    rm "$SYSCONFDIR/$SITESENABLED/$SITENAME$EXTSITE" 2>/dev/null
    RETVAL=$?
    if [ $RETVAL -ne 0 ]; then
        rm -f "$SYSCONFDIR/$SITESENABLED/${PRIORITY:+$PRIORITY-}$SITENAME$EXTSITE"
        RETVAL=$?
    fi
    if [ $RETVAL -eq 0 ]; then
        echo "Site '$SITENAME' disabled; run 'systemctl reload nginx' to fully disable."
    else
        echo "Site '$SITENAME' is not disabled."
        return 1
    fi
} # ----------  end of function disable_site  ----------}}}
long_help (){ #{{{
    echo "Run '$PROGDISABLE [site]' to disable a site"
    echo "Run '$PROGENABLE [site] [priority]' to enable a site"
    echo "If you do not specify the name of a site you will be asked to do so."
} # ----------  end of function long_help  ----------}}}
short_help (){ #{{{
    echo "Run '$PROGRAMNAME -h' to see help"
} # ----------  end of function short_help  ----------}}}
show_version (){ #{{{
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  show_version
#   DESCRIPTION:  show version of this script
#    PARAMETERS:  -
#       RETURNS:  -
#-------------------------------------------------------------------------------
    echo "$PROGRAMNAME version $VERSION"
} # ----------  end of function show_version  ----------}}}
_check_permission (){ #{{{
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  _check_permission
#   DESCRIPTION:  check permission for write to the $SITESENABLED directory
#    PARAMETERS:  -
#       RETURNS:  1 if don't have permission
#-------------------------------------------------------------------------------
    if [ ! -w "$SYSCONFDIR/$SITESENABLED" ]; then
        echo "You don't have permission to write or delete files from the directory: $SYSCONFDIR/$SITESENABLED"
        return 1
    fi
} # ----------  end of function _check_permission  ----------}}}
reload_service (){ #{{{
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  reload_service
#   DESCRIPTION:  
#    PARAMETERS:  
#       RETURNS:  
#-------------------------------------------------------------------------------
    if [ "$RELOADSERVICE" = 'yes' ]; then
        systemctl reload nginx
    fi
} # ----------  end of function reload_service  ----------}}}
### Main program
_check_permission || exit 1
while getopts "$OPTIONS" OPT; do
    case $OPT in
        h)
            long_help
            exit 0
            ;;
        v)
            show_version
            exit 0
           ;;
        ?)
            short_help
            exit 1
            ;;
    esac
done
case $PROGRAMNAME in
    $PROGENABLE)
        enable_site $* && reload_service
        ;;
    $PROGDISABLE)
        disable_site $* && reload_service
        ;;
    *)
        short_help
        exit 1
        ;;
esac
