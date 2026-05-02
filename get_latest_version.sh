_url=https://ftp.mozilla.org/pub/firefox/nightly
_lang=en-US
_version=$(curl ${_url}/latest-mozilla-central/ | grep "${_lang}.linux-x86_64.checksums" | sed "s/^.*>firefox-//; s/\.$1.*//" | sort -n | tail -n 1)
_build_id_raw="$(curl -s "${_base_url}/latest-mozilla-central/${_name}-${_version}.${_lang}.linux-${CARCH}.checksums" | grep '.partial.mar' | cut -d' ' -f4 | grep -E -o '[[:digit:]]{14}' | sort | tail -n1)"
declare -A _build_id
_build_id=(
    [year]="${_build_id_raw:0:4}"
    [month]="${_build_id_raw:4:2}"
    [day]="${_build_id_raw:6:2}"
    [hour]="${_build_id_raw:8:2}"
    [min]="${_build_id_raw:10:2}"
    [sec]="${_build_id_raw:12:2}"
    [date]="${_build_id_raw:0:8}"
    [time]="${_build_id_raw:8:6}"
)
_build_id_date=${_build_id[date]}
_build_id_time=${_build_id[time]}
pkgver=$(printf "%s.%s.%s" ${_version} ${_build_id_date} ${_build_id_time})
echo "version=${_version}"
echo "pkgver=${pkgver}"

sed -i "s/pkgver=.*$/pkgver=${pkgver}/" PKGBUILD
sed -i "s/_version=.*$/_version=${_version}/" PKGBUILD
sed -i "s/_language=placeholder/_language=\"$2\"/" PKGBUILD
sed -i "s/_language_short=placeholder/_language_short=$1/" PKGBUILD
cat PKGBUILD
updpkgsums
