# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com. Debian package"
pkgver='1.0.1'
_rc=''
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
pkgrel=1
_pkgrel=${pkgrel}
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('amd64' 'arm64' 'armhf' 'armel')
arch=('any')
url="https://${_pkggopath}"
makedepends=('dpkg')
depends=()
_debdeps=""
#_debdeps=""
_scripts="skywire-scripts"
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source=(
"${_scripts}.tar.gz"
"${_release_url}-amd64.tar.gz"
"${_release_url}-arm64.tar.gz"
"${_release_url}-armhf.tar.gz"
"${_release_url}-arm.tar.gz"
)
noextract=(
"${_binarchive}-amd64.tar.gz"
"${_binarchive}-arm64.tar.gz"
"${_binarchive}armhf.tar.gz"
"${_release_url}-arm.tar.gz"
)
sha256sums=('9f3fb29acf20089cabd14fe27c7c8384b4d327750b23ff4ca4621d2f7953f3dd'
            '6cbbadb07ca6668dc04a91565b08e590e844422a28a813f1bb76a184b422432e'
            '61dc18d71d766e707ccbdc9c0f5b0bbf0a992e6acdc0c53c1c9cba6ecc85f601'
            '1633c917e1468de0295d7d3b30059156f194e18722578cb90fd49cd683a7f5d0'
            '6182f947e66a41c6793addd08ab8cc00fa09c132001e13f05e8f11464987c7ea')

build() {
  _msg2 'creating the DEBIAN/control files'
  for i in ${_pkgarches[@]}; do
    _msg2 "_pkgarch=$i"
    local _pkgarch=$i
    #create control file for the debian package
    echo "Package: ${pkgname}" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Provides: ${_pkgname}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: ${_githuborg}" >> ${srcdir}/${_pkgarch}.control
    echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
  done
}

package() {

for i in ${_pkgarches[@]}; do
_msg2 "_pkgarch=${i}"
local _pkgarch=${i}
local _pkgarch1=${_pkgarch}
if [[ ${_pkgarch} == "armel" ]] ; then
  local _pkgarch1=arm
fi

local _binaryarchive="${_pkgname}-${_tag_ver}-linux-${_pkgarch1}.tar.gz"
[[ -f ${srcdir}/${_pkgname}-visor ]] && rm -rf ${srcdir}/${_pkgname}-visor
[[ -f ${srcdir}/${_pkgname}-cli ]] && rm -rf ${srcdir}/${_pkgname}-cli
[[ -d ${srcdir}/apps ]] && rm -rf ${srcdir}/apps
[[ -d ${pkgdir}/test ]] && rm -rf ${pkgdir}/test
mkdir -p ${pkgdir}/test && cd ${pkgdir}/test
tar -xf ${srcdir}/${_binaryarchive}

_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${pkgname}-${pkgver}-${pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"

_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts
mkdir -p ${_pkgdir}/${_systemddir}

cd $_pkgdir
_msg2 'installing binaries'
 install -Dm755 ${pkgdir}/test/${_pkgname}-cli ${_pkgdir}/${_skybin}/
 install -Dm755 ${pkgdir}/test/${_pkgname}-visor ${_pkgdir}/${_skybin}/
for _i in ${_pkgdir}/${_skybin}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'installing app binaries'
_apps=${pkgdir}/test/apps
install -Dm755 ${_apps}/* ${_pkgdir}/${_skyapps}/
for _i in ${_pkgdir}/${_skyapps}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Installing scripts'
install -Dm755 ${srcdir}/${_scripts}/${_pkgname}/* ${_pkgdir}/${_skyscripts}/
for _i in ${_pkgdir}/${_skyscripts}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${pkgdir}/test/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/* ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywirevpn.SkywireVPN.desktop ${_pkgdir}/usr/share/applications/com.skywirevpn.SkywireVPN.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/skywire.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
install -Dm644 ${srcdir}/${_scripts}/desktop/skywirevpn.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywirevpn.png

_msg2 'installing control file and install scripts'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/${_scripts}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/${_scripts}/prerm.sh ${_pkgdir}/DEBIAN/prerm
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
#create the debian package!
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
