# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skyimager
_pkgname=skyimager-gui
_projectname=skycoin
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/skycoin/skybian"
license=()
makedepends=()
depends=()
source=("${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('9fea28c31508edffba69912c5e91950a078c83b58e0a18e45a56fc84eddb0446')


_maintainer="Moses Narrow"
_pkgname=${pkgname}
_pkgarch=$(dpkg --print-architecture)
_pkgver=${pkgver}
_pkgrel=${pkgrel}
_debdeps=""

build() {
############################################################
#BUILD AS YOU NORMALLY WOULD HERE
############################################################
#create control file for the debian package
echo "Package: ${_pkgname}" > ${srcdir}/control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
echo "Priority: optional" >> ${srcdir}/control
echo "Section: web" >> ${srcdir}/control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
echo "Depends: ${_debdeps}" >> ${srcdir}/control
echo "Maintainer: ${_maintainer}" >> ${srcdir}/control
echo "Description: ${pkgdesc}" >> ${srcdir}/control
}



package() {
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
mkdir -p ${_pkgdir}/usr/bin

_msg2 'installing files'
#  install -Dm755 ${srcdir}/linux-amd64/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
install -Dm755 ${srcdir}/linux-amd64/skybian ${_pkgdir}/usr/bin/${_pkgname}
#ln -rTsf ${_pkgdir}/usr/bin/${_pkgname} ${_pkgdir}/usr/bin/${pkgname}

_msg2 'installing control file'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

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
