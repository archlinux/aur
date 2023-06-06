#!/usr/bin/env sh
##########################################################
######################### License ########################

## The MIT License (MIT)
##
## Copyright © 2022 Fabian Bornschein <fabiscafe/at/mailbox/dot/org>
##
##Permission is hereby granted, free of charge, to any person obtaining a copy
##of this software and associated documentation files (the “Software”), to
##deal in the Software without restriction, including without limitation the
##rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
##sell copies of the Software, and to permit persons to whom the Software is
##furnished to do so, subject to the following conditions:
##
##The above copyright notice and this permission notice shall be included in
##all copies or substantial portions of the Software.
##
##THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
##AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
##FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
##IN THE SOFTWARE.

##########################################################
###################### Permissions #######################

# Exit script on failures
set -e

# Exit script if not called by root
if [ $(id -u) -ne 0 ]; then
    printf "You must be root\n"
    exit 1
fi

##########################################################
###################### Dependencies ######################

# Only run this script if all dependencies are available
Dependencylist=(
  "/usr/bin/runuser"
  "/usr/bin/systemctl"
  "pnpm"
)

for dep in ${Dependencylist[@]}; do
    if ! [ -f ${dep} ]; then
        printf "Dependency: ${dep} not found\n"
        DEP_MISSING=1
    fi
done
# Stop here if a dependency is missing
if ! [ -z ${DEP_MISSING+x} ]; then
    exit 1
fi

##########################################################
####################### Functions ########################

HELP()
{
   printf "Calckey helper script.\n"
   printf "\n"
   printf "Syntax: %s -[i|I|m|M|h]\n" $0
   printf "options:\n"
   printf -- "  -i\tInitialize calckey databases for the first run.\n"
   printf -- "  -I\tSame as -i, without DB and Redis check. (For use with external database servers)\n"
   printf -- "  -m\tMigrate the database to the new version.\n"
   printf -- "  -M\tSame as -m, without DB and Redis check. (For use with external database servers)\n"
   printf -- "  -h\tPrint this Help.\n"
   printf "\n"
   printf "https://wiki.archlinux.org/title/Calckey\n"
}

PSQL_REDIS_STATUS()
{
    printf "Current service-status\n"
    printf "   PostgreSQL:\t%s\n" $(/usr/bin/systemctl is-active postgresql.service)
    printf "   Redis:\t%s\n" $(/usr/bin/systemctl is-active redis.service)
}

PSQL_REDIS_DEP()
{
if ! /usr/bin/systemctl is-active postgresql.service redis.service > /dev/null; then
    printf "This functionality requires PostgreSQL and Redis running\n"
    printf "Please start the services and run %s again\n" $0
    printf "\n"
    PSQL_REDIS_STATUS
    exit 1;
fi
}

INIT()
{
    ## It should be impossible that calckey runs before init, but better check anyways
    if /usr/bin/systemctl is-active calckey.service > /dev/null; then
        printf "Shutting down calckey…\n"
        /usr/bin/systemctl stop calckey.service
    fi
    printf "Initialize Calckey databases…\n"
    cd /usr/share/webapps/calckey
    /usr/bin/runuser -u calckey -- env HOME="/usr/share/webapps/calckey" pnpm run init
}

MIGRATE()
{
    # Calckey needs to be stopped before migration.
    if /usr/bin/systemctl is-active calckey.service > /dev/null; then
        printf "Shutting down calckey\n"
        /usr/bin/systemctl stop calckey.service
        MK_ACTIVE=1
    fi
    printf "Migrate data to new version\n"
    cd "/usr/share/webapps/calckey/"
    /usr/bin/runuser -u calckey -- env HOME="/usr/share/webapps/calckey" pnpm run migrate
    if ! [ -z ${MK_ACTIVE+x} ] ; then
        printf "starting up calckey\n"
        /usr/bin/systemctl start calckey.service
    else
        printf "Calckey service is *not* started\n"
        printf "Thats your job!\n"
    fi
}

##########################################################
########################## Main ##########################

# Get the options
while getopts "i I m M h" option; do
    case $option in
        i)
            PSQL_REDIS_DEP
            INIT
            exit 0;;
        I)
            INIT
            exit 0;;
        m)
            PSQL_REDIS_DEP
            MIGRATE
            exit 0;;
        M)
            MIGRATE
            exit 0;;
        \?)
            HELP
            exit 0;;
   esac
done

HELP
exit 0
