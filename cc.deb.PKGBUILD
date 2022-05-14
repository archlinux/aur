# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_pkgname1=${pkgname/-bin/-systray}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com. Debian package"
pkgver='1.0.0'
_rc='-rc2'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
pkgrel=1
_pkgrel=${pkgrel}
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
arch=('any')
url="https://${_pkggopath}"
makedepends=('dpkg') # 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl') #'aarch64-linux-musl' 'arm-linux-gnueabihf-musl' 'skycoin-keyring')
depends=()
_debdeps=""
#_debdeps=""
_scripts="skywire-scripts"
_binarchive=("${_pkgname1}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source=(
"${_scripts}.tar.gz"
"${_release_url}-amd64.tar.gz"
"${_release_url}-arm64.tar.gz"
"${_release_url}-arm.tar.gz"
)
noextract=(
"${_binarchive}-amd64.tar.gz"
"${_binarchive}-arm64.tar.gz"
"${_binarchive}arm.tar.gz"
)
sha256sums=('c4ae79cd455f557c74f19b8cfd206712d4d16224743277e8b2e58db508bbdeba'
            '284e12906c8656a603477c7a13c51a5266fe289fce3bed61206d88a59de1169c'
            '12d0c6a72af7c8ec951117982b2ea22dc6d5fc29f1aba174bc8cac3d329a5082'
            'eb4a85c6eb6ac1280d4a8c4ddb36a2a2f049b807cdbc415acb945d48824e5508')

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
    #echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
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
if [[ ${_pkgarch} == "armhf" ]] ; then
  local _pkgarch1=arm
fi

local _binaryarchive="${_pkgname1}-${_tag_ver}-linux-${_pkgarch1}.tar.gz"
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

cd $_pkgdir
_msg2 'installing binaries'
_binaries=("${_pkgname}-cli" "${_pkgname}-visor")
for i in ${_binaries[@]}; do
_msg3 "${i}"
 install -Dm755 ${pkgdir}/test/${i} ${_pkgdir}/${_skybin}/${i}
 ln -rTsf ${_pkgdir}/${_skybin}/${i} ${_pkgdir}/usr/bin/${i}
done
_msg2 'installing app binaries'
_apps=${pkgdir}/test/apps
_appbinaries=$( ls "${_apps}" )
for i in ${_appbinaries}; do
  _msg3 "${i}"
  install -Dm755 ${_apps}/${i} ${_pkgdir}/${_skyapps}/${i}
  ln -rTsf ${_pkgdir}/${_skyapps}/${i} ${_pkgdir}/usr/bin/${i}
done

_msg2 'installing scripts'
_scripts1=${srcdir}/${_scripts}/${_pkgname}
_skywirescripts=$( ls "${_scripts1}" )
for i in ${_skywirescripts}; do
  _install2 ${_scripts1}/${i} ${_skyscripts}
done

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

#install dmsghttp-config.json
install -Dm644 ${pkgdir}/test/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service
#this is to overwrites any previous file not provided by this package
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}-hypervisor.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig-remote.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig-remote.service

#desktop integration
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywirevpn.SkywireVPN.desktop ${_pkgdir}/usr/share/applications/com.skywirevpn.SkywireVPN.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywire.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywirevpn.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywirevpn.png

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

_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${_pkgdir}/${2}/${_binname}
ln -rTsf ${_pkgdir}/${2}/${_binname} ${_pkgdir}/usr/bin/${_binname}
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
