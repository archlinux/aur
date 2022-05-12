# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com. Debian package"
pkgver='0.6.0'
pkgrel=18
_pkgver=${pkgver}
_pkgrel=${pkgrel}
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
arch=('any')
url="https://${_pkggopath}"
makedepends=('dpkg') # 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl') #'aarch64-linux-musl' 'arm-linux-gnueabihf-musl' 'skycoin-keyring')
depends=()
_debdeps=""
#_debdeps=""
_scripts="skywire-deb-scripts"
_binarchive=("${_pkgname}-${_tag_ver}-linux")
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
sha256sums=('fa42fb88711391d6fbf29ab457e3c6044735155707332af03afc77f506693fdc'
            '2358b979e9eb917ffcbaf2236051a300d0d0f684edfeec840399c09d75751aa1'
            'bd8e28b1829bb17d6a975c2c0b93c5355ba90540a84541aa3852ea93c1445810'
            'a1e87d6fb8999caab7a9e71760c338faf2a4768141c0b1cfcdf806890090f166')

build() {
  _msg2 'creating the DEBIAN/control files'
  for i in ${_pkgarches[@]}; do
    _msg2 "_pkgarch=$i"
    local _pkgarch=$i
    #create control file for the debian package
    echo "Package: skywire-bin" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    #echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Provides: ${pkgname}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: Skycoin" >> ${srcdir}/${_pkgarch}.control
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

local _binaryarchive="${_pkgname}-${_tag_ver}-linux-${_pkgarch1}.tar.gz"
[[ -f ${srcdir}/${_pkgname}-visor ]] && rm -rf ${srcdir}/${_pkgname}-visor
[[ -f ${srcdir}/${_pkgname}-cli ]] && rm -rf ${srcdir}/${_pkgname}-cli
[[ -d ${srcdir}/apps ]] && rm -rf ${srcdir}/apps
[[ -d ${pkgdir}/test ]] && rm -rf ${pkgdir}/test
mkdir -p ${pkgdir}/test && cd ${pkgdir}/test
tar -xf ${srcdir}/${_binaryarchive}

_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-bin-${pkgver}-${_pkgrel}-${_pkgarch}"
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
install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'installing systemd services'
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service
#this is to overwrites any previous file not provided by this package
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}-hypervisor.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig-remote.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig-remote.service

#desktop integration
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywire.png ${_pkgdir}/${_skydir}/icon.png
mkdir -p ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
ln -rTsf ${_pkgdir}/${_skydir}/icon.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png

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
chmod +x ${_pkgdir}/usr/bin/${_binname}
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
