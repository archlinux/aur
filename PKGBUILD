#Maintainer: weearc <q19981121@163.com>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.5.0
pkgrel=1
_rel=3.88
epoch=
pkgdesc="Great pdf reader.(using rpm package to speed up installation.)"
arch=("x86_64")
url="https://github.com/agalwood/Motrix"
license=('MIT')
groups=()
depends=('bash'
	 'tar'
	 'fakeroot'
	 'libunarr')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('yacreader'
                 'yacreader-nopdf')
replaces=('yacreader')
changelog=
source=(
	"yacreader.rpm"::"https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/yacreader-$pkgver-$_rel.$arch.rpm")
noextract=()
sha256sums=('8d00112a632c3bcddfd4b7278c48929ae506cfd2c004eca52b7ec7ec18346f56')
validpgpkeys=()

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
#     install -Dm 755 usr/bin/YACReader ${pkgdir}/usr/bin/YACReader
#     install -Dm 755 usr/bin/YACReader ${pkgdir}/usr/bin/YACReaderLibrary
#     install -Dm 644 usr/share ${pkgdir}/usr/share
#     rm -rf ${srcdir}
}
