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
pkgver='1.0.0'
pkgrel=8
_rc=''
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkgrel=${pkgrel}
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
license=()
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl')
depends=()
_debdeps=""
_scripts="skywire-scripts"
source=( "${url}/archive/refs/tags/${_tag_ver}.tar.gz"
"${_scripts}.tar.gz"  )
sha256sums=('fa81cd4e7860bcb5ae49b7b6231c26ea1e4a5846323e433df0a03400129dabdf'
            '5b3e463d50bf0eb912cac18521fec476d28e52f63ea4d441778ed48daf9073d5')

prepare() {
 # https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_pkgarch} ${srcdir}/go/apps.${_pkgarch}
[[ -d ${srcdir}/${pkgname} ]] && rm -rf ${srcdir}/${pkgname}
 ln -rTsf ${srcdir}/${_pkgname}-${pkgver}${_rc} ${srcdir}/go/src/${_pkggopath}
 ln -rTsf ${srcdir}/${_pkgname}-${pkgver}${_rc} ${srcdir}/${_pkgname}
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

_buildbins() {
_GOHERE=$2  #target bin dir
_binpath=$3   #find the binary here- expecting 'apps/' or empty
_binname=$1 #which binary to build
_msg2 "building ${_binname} binary"
cd ${_cmddir}/${_binpath}${_binname}
go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $_GOHERE/ .
}

package() {
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}${_rc}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts
mkdir -p ${_pkgdir}/${_systemddir}

cd $_pkgdir
_msg2 'installing binaries'
install -Dm755 ${srcdir}/go/bin/* ${_pkgdir}/${_skybin}
for _i in ${_pkgdir}/${_skybin}/*; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'installing apps'
install -Dm755 ${srcdir}/go/apps/* ${_pkgdir}/${_skyapps}
for _i in ${_pkgdir}/${_skyapps}/*; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Installing scripts'
install -Dm755 ${srcdir}/${_scripts}/${_pkgname}/* ${_pkgdir}/${_skyscripts}/
for _i in ${_pkgdir}/${_skyscripts}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${srcdir}/${_pkgname}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing skywire systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/* ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywirevpn.SkywireVPN.desktop ${_pkgdir}/usr/share/applications/com.skywirevpn.SkywireVPN.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/skywire.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
install -Dm644 ${srcdir}/${_scripts}/desktop/skywirevpn.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywirevpn.png

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

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
