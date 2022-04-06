# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyhwd
_pkgname=hardware-wallet-daemon
_githuborg=skycoin
pkgdesc="HTTP API to interface with the Skycoin hardware wallet. skycoin.com"
pkgver=1.0.0
pkgrel=1
arch=('any')
_pkgver=${pkgver}
_pkgrel=${pkgrel}
_tag_ver="v${_pkgver}"
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64')
url="https://skycoin.com"
makedepends=('dpkg') # 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl') #'aarch64-linux-musl' 'arm-linux-gnueabihf-musl' 'skycoin-keyring')
depends=('skycoin')
_debdeps="skycoin"
_binarchive=("skyhwd-${pkgver}-linux")
_release_url=("https://downloads.skycoin.com/skywallet-daemon/${_binarchive}")
source=("${_release_url}-x64.tar.bz2"
"${_release_url}-arm-7.tar.bz2")
sha256sums=('70ca900325d77c2b97c963db4b5de79b3e4821c279fc5a0bf367f4c0d11011c6'
'26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')

noextract=(
"${_binarchive}-x64.tar.bz2"
"${_binarchive}-arm-7.tar.bz2"
)

build() {
  _msg2 'creating the DEBIAN/control files'
  for i in ${_pkgarches[@]}; do
    _msg2 "_pkgarch=$i"
    local _pkgarch=$i
    #create control file for the debian package
    echo "Package: skyhwd" > ${srcdir}/${_pkgarch}.control
    echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
    echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
    echo "Section: web" >> ${srcdir}/${_pkgarch}.control
    echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
    echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
    echo "Maintainer: Skycoin" >> ${srcdir}/${_pkgarch}.control
    echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
  done
}

package() {

for i in ${_pkgarches[@]}; do
_msg2 "_pkgarch=${i}"
local _pkgarch=${i}
local _pkgarch1=${_pkgarch}
if [[ ${_pkgarch} == "armhf" ]] || [[ ${_pkgarch} == "arm64" ]]  ; then
  local _pkgarch1="arm-7"
fi
if [[ ${_pkgarch} == "amd64" ]]  ; then
  local _pkgarch1="x64"
fi

local _binaryarchive="${_binarchive}-${_pkgarch1}.tar.bz2"
[[ -d ${pkgdir}/test ]] && rm -rf ${pkgdir}/test
mkdir -p ${pkgdir}/test && cd ${pkgdir}/test
tar -xf ${srcdir}/${_binaryarchive}

_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-bin-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/skycoin"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin

cd $_pkgdir
_msg2 'installing udev rule'
 install -Dm644 ${pkgdir}/test/lib/udev/rules.d/50-skyhwd.rules ${_pkgdir}/usr/lib/udev/rules.d/50-skyhwd.rules
 _msg2 'installing systemd service'
 install -Dm644 ${pkgdir}/test/usr/lib/systemd/system/skyhwd.service ${_pkgdir}/${_systemddir}/skyhwd.service
 _msg2 'installing binary'
 install -Dm755 ${srcdir}/usr/bin/skyhwd ${_pkgdir}/${_skybin}/skyhwd
 ln -rTsf ${_pkgdir}/${_skybin}/skyhwd ${_pkgdir}/usr/bin/skyhwd

_msg2 'installing control file'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control

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
