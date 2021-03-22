#!/bin/bash
set -euxo pipefail

source PKGBUILD
PKG=${pkgname}

# Get latest version
metainfo=$(curlie --silent \
		https://www.eset.com/int/business/download/endpoint-antivirus-linux/ \
		type==13554 \
		tx_esetdownloads_ajax[product]==78 \
		tx_esetdownloads_ajax[page_id]==308 \
		tx_esetdownloads_ajax[plugin_id]==34508 \
		tx_esetdownloads_ajax[beta]==0)
VER=$(jq -r 'first(.files.installer[]).full_version' <(cat <<< "$metainfo"))
bundle=$(basename $(jq -r 'first(.files.installer[]).url' <(cat <<< "$metainfo")))
CHANGELOG=$(xq -r '.changelog.ul[0].li' <(cat <<< "<changelog>`jq -r 'first(.changelogs[])' <(cat <<< "$metainfo")`</changelog>"))

# Insert latest version into PKGBUILD
sed -i \
	-e "s/^_pkgver_major=.*/pkgver=${VER%%.*}/" \
	-e "s/^pkgver=.*/pkgver=${VER}/" \
	-e 's/^pkgrel=.*/pkgrel=1/' \
	-e "s/^_bundle_file=.*/_bundle_file=${bundle}/" \
	PKGBUILD

# Check whether this changed anything
if (git diff -s --exit-code PKGBUILD); then
	echo "Package ${PKG} has most recent version ${VER}"
	exit 0
fi

# Update hashes
updpkgsums

# Update deb package name
deb_package=$(tail -n +`awk '/^exit$/ { print NR + 1; exit }' ${bundle}` ${bundle} | bsdtar -tf - | grep deb | tail -n1)

if [[ ! "${deb_package}" =~ ^eea-${VER}-(.*).x86_64.deb$ ]]; then
	echo "Deb package name ${deb_package} has unexpected format"
	exit 1
fi

sed -i -e "s/^distro=.*/_distro=${BASH_REMATCH[1]}/" PKGBUILD

# Update install file
tail -n +`awk '/^exit$/ { print NR + 1; exit }' ${bundle}` ${bundle} | 
	bsdtar -xOf - ${deb_package} |    # deb from bundle
	bsdtar -xOf - control.tar.gz |    # control.tar.gz from deb
	bsdtar -xf - "pre*" "post*"       # install scripts from control.tar.gz

csplit preinst "/### Upgrade ###/" --suppress-matched -f preinst --quiet

echo "pre_install() {
`sed -e "s/^/\t/g" preinst00`
}

pre_upgrade() {
`sed -e "s/^/\t/g" preinst | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "2" ]/true/g'`
}

post_install() {
`sed -e "s/^/\t/g" postinst | sed -e 's/\[ "$1" = "configure" ] || \[ "$1" = "1" ]/true/g' -e 's/\[ "$1" = "2" ]/false/g' -e 's/\[ "$1" = "configure" ] && \[ -n "$2" ]/true/g'`
}

post_upgrade() {
`sed -e "s/^/\t/g" postinst | sed -e 's/\[ "$1" = "configure" ] || \[ "$1" = "1" ]/true/g' -e 's/\[ "$1" = "2" ]/false/g' -e 's/\[ "$1" = "configure" ] && \[ -n "$2" ]/true/g'`
}

pre_remove() {
`sed -e "s/^/\t/g" prerm | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "1" ]/false/g'`
}

post_remove() {
`sed -e "s/^/\t/g" postrm | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "1" ]/false/g' -e 's/\[ "$1" = "purge" ]/false/g'`
}" | sed -e "/#!/d;s/[ \t]*$//" > eea.install

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO eea.install
git commit -m "${PKG} v${VER}

${CHANGELOG}"

