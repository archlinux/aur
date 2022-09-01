# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Develop Banch. Debian package"
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
#leave arch package as any
arch=('any')
pkgver='1.1.0'
pkgrel=1
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
license=('license-free')
source=( "${url}/archive/refs/tags/${_tag_ver}.tar.gz"
"skywire-autoconfig::https://aur.archlinux.org/cgit/aur.git/plain/skywire-autoconfig?h=skywire-bin"
"com.skywire.Skywire.desktop::https://aur.archlinux.org/cgit/aur.git/plain/com.skywire.Skywire.desktop?h=skywire-bin"
"com.skywirevpn.SkywireVPN.desktop::https://aur.archlinux.org/cgit/aur.git/plain/com.skywirevpn.SkywireVPN.desktop?h=skywire-bin"
"skywirevpn.png::https://aur.archlinux.org/cgit/aur.git/plain/skywirevpn.png?h=skywire-bin"
"skywire.png::https://aur.archlinux.org/cgit/aur.git/plain/skywire.png?h=skywire-bin"
"skywire.service::https://aur.archlinux.org/cgit/aur.git/plain/skywire.service?h=skywire-bin"
"skywire-autoconfig.service::https://aur.archlinux.org/cgit/aur.git/plain/skywire-autoconfig.service?h=skywire-bin"
"postinst.sh::https://aur.archlinux.org/cgit/aur.git/plain/postinst.sh?h=skywire-bin"
"prerm.sh::https://aur.archlinux.org/cgit/aur.git/plain/prerm.sh?h=skywire-bin"
)
sha256sums=('2f50904749231ffddf8ca348214491289d1ca099192caf0c9d0a9a7409f9a7ff'
            '08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c'
            '7b17a55e64d1371fecd24edc3da7c6a762cf2b3d058f6fc4a5dc7c5f9b4cff09'
            '233ccf0e87b37e782828f53960e05e478cf381f61bbfdb16a0cc0254ee8be7c2')

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
install -Dm755 ${srcdir}/skywire-autoconfig ${_pkgdir}/${_skyscripts}/
ln -rTsf ${_pkgdir}/${_skyscripts}/skywire-autoconfig ${_pkgdir}/usr/bin/skywire-autoconfig
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${srcdir}/${_pkgname}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

#install systemd services
_msg2 'Installing systemd services'
install -Dm644 ${srcdir}/*.service ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/*.desktop ${_pkgdir}/usr/share/applications/
install -Dm644 ${srcdir}/*.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/

_msg2 'installing control file and install scripts'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/prerm.sh ${_pkgdir}/DEBIAN/prerm
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

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
