# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Develop Banch. Debian package"
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
#leave arch package as any
arch=('any')
#manually version for now
pkgver='0.6.0'
_pkgver=${pkgver}
pkgrel=4
_pkgrel=${pkgrel}
#pkgrel=4
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
license=()
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl')
depends=()
_debdeps=""
#_debdeps="reprepro"
_scripts="skywire-deb-scripts"
#source=("git+${url}.git#branch=${BRANCH:-develop}"
source=( "${url}/archive/refs/tags/v${pkgver}.tar.gz"
"${_scripts}.tar.gz"  )
sha256sums=('f1c6ae2dbe36cda0767855ac1b8676751358ca782e2c3d8ee16ba9b0de9b2bc3'
            '1ff213945f7c009572f71fdf00aea28c464996fbc4bf946b03c8787ac0cd47d9')

#tar -czvf skywire-deb-scripts.tar.gz skywire-deb-scripts
#updpkgsums deb.PKGBUILD

prepare() {
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
	mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_pkgarch} ${srcdir}/go/apps.${_pkgarch}
  ln -rTsf ${srcdir}/${_pkgname}-${_pkgver} ${srcdir}/go/src/${_pkggopath}
  ln -rTsf ${srcdir}/${_pkgname}-${_pkgver} ${srcdir}/${_pkgname}
  cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
local GOPATH=${srcdir}/go
local GOBIN=${GOPATH}/bin
local _GOAPPS=${GOPATH}/apps
local GOOS=linux
export CC=musl-gcc

#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
_cmddir=${srcdir}/go/src/${_pkggopath}/cmd

_buildbins skychat $_GOAPPS apps/
_buildbins skysocks $_GOAPPS apps/
_buildbins skysocks-client $_GOAPPS apps/
_buildbins vpn-client $_GOAPPS apps/
_buildbins vpn-server $_GOAPPS apps/
_buildbins skywire-visor $GOBIN
_buildbins skywire-cli $GOBIN
_buildbins setup-node $GOBIN

#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)

### CONTROL FILES CREATION ###
#create control file for the debian package
echo "Package: skywire" > ${srcdir}/control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
echo "Priority: optional" >> ${srcdir}/control
echo "Section: web" >> ${srcdir}/control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
echo "Depends: ${_debdeps}" >> ${srcdir}/control
echo "Maintainer: skycoin" >> ${srcdir}/control
echo "Description: ${pkgdesc}" >> ${srcdir}/control
}

#speed up the build for testing - there's a risk of using old binaries.
_buildbins() {
_GOHERE=$2  #target bin dir
_binpath=$3   #find the binary here- expecting 'apps/' or empty
_binname=$1 #which binary to build
_msg2 "building ${_binname} binary"
if [[ ! -f ${_GOHERE}/${_binname} ]] ; then #don't waste time rebuilding existing bins
	cd ${_cmddir}/${_binpath}${_binname}
  go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $_GOHERE/ .
fi
}

package() {
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts

cd $_pkgdir

_msg2 'installing binaries'
#loop to install the binaries
_skywirebins=$( ls ${srcdir}/go/bin )
for i in ${_skywirebins}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/bin/${i} ${_skybin}
done

_msg2 'installing apps'
#loop to install the apps
_skywireapps=$( ls ${srcdir}/go/apps )
for i in ${_skywireapps}; do
  _msg2 "$i"
  _install2 ${srcdir}/go/apps/${i} ${_skyapps}
done

_msg2 'installing scripts'
_skywirescripts=$( ls ${srcdir}/${_scripts}/${_pkgname} )
for i in ${_skywirescripts}; do
  _install2 ${srcdir}/${_scripts}/${_pkgname}/${i} ${_skyscripts}
done

ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing skywire systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service

_msg2 'installing desktop files and icon'
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/skywire.png ${_pkgdir}/${_skydir}/icon.png
ln -rTsf ${_pkgdir}/${_skydir}/icon.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png

_msg2 'installing skywire control file, postinst & postrm scripts'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control
install -Dm755 ${srcdir}/${_scripts}/postinst.sh ${_pkgdir}/DEBIAN/postinst
[[ -f ${srcdir}/${_scripts}/postrm.sh ]] && install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
#exit so the arch package doesn't get built
exit
}

_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${_pkgdir}/${2}/${_binname}
ln -rTsf ${_pkgdir}/${2}/${_binname} ${_pkgdir}/usr/bin/${_binname}
chmod +x ${_pkgdir}/usr/bin/${_binname}
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
