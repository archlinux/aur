_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Debian package; cross-compile."
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver='1.0.1'
pkgrel=2
#pkgrel=1
_rc=''
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkgrel=${pkgrel}
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
arch=('any')
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl') # 'arm-linux-gnueabihf-binutils' 'aarch64-binutils') #'aarch64-linux-musl' 'arm-linux-gnueabihf-musl' 'skycoin-keyring')
_debdeps=""
install=skywire.install
_scripts="skywire-scripts"
source=("${url}/archive/refs/tags/${_tag_ver}.tar.gz"
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
sha256sums=('40094504531bedee0e5a8b2f91d7f1a0312a1176ff416fe4fb09a33aa5c1d562'
            'ac16dfee9ed4870ef4afc977211d1c47c36ee182c8511d41a940cdd98c483f4d'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            'e6ea2c7471bcf5bc83e8fd831c047ba61b98eab58ca7c055475714dcf6066539'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            'c8d9f7394763997bb3917c55dd288d431d7054c7f1edec55540a4c02600dd7d3'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c'
            '7b17a55e64d1371fecd24edc3da7c6a762cf2b3d058f6fc4a5dc7c5f9b4cff09'
            '233ccf0e87b37e782828f53960e05e478cf381f61bbfdb16a0cc0254ee8be7c2')
#tar -czvf skywire-deb-scripts.tar.gz skywire-deb-scripts
#updpkgsums deb.PKGBUILD

prepare() {
for i in ${_pkgarches[@]}; do
_msg2 "$i"
done
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin.${_pkgarches[@]} ${srcdir}/go/apps.${_pkgarches[@]}
ln -rTsf ${srcdir}/${pkgname}-${pkgver}${_rc} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
local GOPATH=${srcdir}/go
export GOOS=linux
export CGO_ENABLED=1

for i in ${_pkgarches[@]}; do
msg2 "_pkgarch=$i"
local _pkgarch=$i
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin.${_pkgarch}
export _GOAPPS=${GOPATH}/apps.${_pkgarch}
export GOOS=linux
#static cross-compilation
[[ $_pkgarch == "amd64" ]] && export GOARCH=amd64 && export CC=musl-gcc
[[ $_pkgarch == "arm64" ]] && export GOARCH=arm64 && export CC=aarch64-linux-musl-gcc
[[ $_pkgarch == "armhf" ]] && export GOARCH=arm && export GOARM=6 && export CC=arm-linux-gnueabihf-musl-gcc
#_ldflags=('-linkmode external -extldflags "-static" -buildid=')
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
echo -e "$_pkgarch"
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)

_msg2 'creating the DEBIAN/control files'
#create control file for the debian package
echo "Package: skywire" > ${srcdir}/${_pkgarch}.control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
echo "Section: web" >> ${srcdir}/${_pkgarch}.control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
echo "Maintainer: github.com/the-skycoin-project" >> ${srcdir}/${_pkgarch}.control
echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
 done
}

#had to speed up the build for testing - there's a risk of using old binaries.
_buildbins() {
_GOHERE=$2  #target bin dir
_binpath=$3   #find the binary here- expecting 'apps/' or empty
_binname=$1 #which binary to build
_msg2 "building ${_binname} binary"
cd ${_cmddir}/${_binpath}${_binname}
go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o ${_GOHERE}/${_binname} .
}


package() {
for i in ${_pkgarches[@]}; do
msg2 "_pkgarch=${i}"
local _pkgarch=${i}
GOPATH=${srcdir}/go
GOBIN=${GOPATH}/bin.${_pkgarch}
_GOAPPS=${GOPATH}/apps.${_pkgarch}

_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${_pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skybin="${_skydir}/bin"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts
mkdir -p ${_pkgdir}/${_systemddir}

cd $_pkgdir
_msg2 'installing binaries'
 install -Dm755 ${GOBIN}/* ${_pkgdir}/${_skybin}/
for _i in ${_pkgdir}/${_skybin}/* ; do
ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'installing app binaries'
install -Dm755 ${_GOAPPS}/* ${_pkgdir}/${_skyapps}/
for _i in ${_pkgdir}/${_skyapps}/* ; do
ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Installing scripts'
install -Dm755 ${srcdir}/skywire-autoconfig ${_pkgdir}/${_skyscripts}/
ln -rTsf ${_pkgdir}/${_skyscripts}/skywire-autoconfig ${_pkgdir}/usr/bin/skywire-autoconfig

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${srcdir}/${_pkgname}*/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

#install systemd services
_msg2 'Installing systemd services'
install -Dm644 ${srcdir}/*.service ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/*.desktop ${_pkgdir}/usr/share/applications/
install -Dm644 ${srcdir}/*.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/

_msg2 'installing control file and install scripts'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst
install -Dm755 ${srcdir}/prerm.sh ${_pkgdir}/DEBIAN/prerm
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
