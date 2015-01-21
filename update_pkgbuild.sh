#!/bin/bash

# Make sure we can find our own utilities.
MYDIR=$(dirname "$(readlink -e "${0}")")
PATH="${MYDIR}${PATH:+:${PATH}}"


# Which PKGBUILD to use? Default is the PKGBUILD in the current
# working directory.
pkgbuild_path=./PKGBUILD
if [ ${#} -ge 1 ]; then
    # User explicitly specified a PKGBUILD to modify.
    pkgbuild_path=${1}
fi

if [ ! -f "${pkgbuild_path}" ]; then
    echo "E: PKGBUILD file '${pkgbuild_path}' does not exist. Aborting." >&2
    exit 2
fi

echo "I: Using PKGBUILD file '${pkgbuild_path}'." >&2


# Set defaults for config variables...
_amo_id=
_amo_os=
_amo_url_prefix=

# ...source the PKGBUILD...
. "${pkgbuild_path}" || exit 2

# ...and make sure we at least have an AMO addon ID.
if [ -z "${_amo_id}" ]; then
    echo "E: No AMO addon ID found in PKGBUILD." >&2
    exit 3
fi

echo "I: AMO addon ID : ${_amo_id}" >&2
echo "I: AMO OS filter: ${_amo_os:-(none, use first result)}" >&2
echo "I: AMO URL prefix: ${_amo_url_prefix:-(empty)}" >&2


# Now get the addon info from AMO.
echo "I: Fetching information from AMO..." >&2
amo_info=$(get_latest_info.py \
    ${_amo_os:+--os "${_amo_os}"} ${_amo_url_prefix:+--url-prefix "${_amo_url_prefix}"} \
    --pkgbuild "${_amo_id}"
)

ret=$?
if [ $ret -ne 0 ]; then
    # Could not retrieve addon info.
    exit $ret
fi


# Good, we have the data, so add it to the PKGBUILD after deleting the old
# pkgver, source and *sums variables as well as our own informational comments.
sed -i '/^[[:space:]]*\(#@\|pkgver=\|source=\|[[:alnum:]]*sums=\)/d' "${pkgbuild_path}"

{
    echo "#@"
    echo "#@ --------------------------------------------"
    echo "#@ Lines below automatically added by ${0##*/}."
    echo "${amo_info}"
    echo "#@ --------------------------------------------"
    echo "#@"
} >> "${pkgbuild_path}"

echo "I: PKGBUILD updated." >&2
