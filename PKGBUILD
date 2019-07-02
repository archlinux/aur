#Contributor: weearc <q19981121@163.com>
#Maintainer: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.5.0
pkgrel=2
_rel=3.105
epoch=
pkgdesc="A comic reader for cross-platform reading and managing your digital comic collection.(using rpm package to speed up installation.)"
arch=("x86_64")
url="http://www.yacreader.com"
license=('GPL3')
groups=()
depends=('bash'
	 'tar'
	 'fakeroot'
	 'libunarr'
     'poppler-qt5'
	'qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('yacreader'
                 'yacreader-nopdf')
replaces=('yacreader')
changelog=
source=(
	"yacreader.rpm"::"https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
noextract=()
validpgpkeys=()
sha256sums=('b58253832cd63385ab4f10e46f024c7b201b6a4c1a24d9b241a3830b459a6d30')

# prepare() {
# 
# 
# }
# 
# build() {
# 
# }
package() {
    install -d ${pkgdir}/usr
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/man
	install -d ${pkgdir}/usr/share/doc
	
    cd ${srcdir}
    cp * -rf ${pkgdir}/.
}
