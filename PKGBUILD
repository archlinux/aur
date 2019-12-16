# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.5.0
_rel=3.162
pkgrel=$_rel
pkgdesc='A comic reader for cross-platform reading and managing your digital comic collection.(using rpm package to speed up installation.) -'
arch=('x86_64')
url='http://www.yacreader.com'
license=('GPL3')
depends=('libunarr' 'qt5-base' 'qt5-multimedia' 'poppler-qt5')
provides=('yacreader' 'yacreader-nopdf')
conflicts=('yacreader' 'yacreader-nopdf')
replaces=('yacreader' 'yacreader-nopdf')
source=("https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
sha256sums=('accb66149d6982e2e44e2b28d7d7ce2aa73a7ecd77cdbf40018bdfca8f9e633d')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
}
