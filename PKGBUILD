# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.6.2.1909283
_rel=7.66
pkgrel="$_rel"
pkgdesc='A comic reader for cross-platform reading and managing your digital comic collection, using upstream binaries.'
arch=('x86_64')
url='http://www.yacreader.com'
license=('GPL3')
depends=('libunarr-bin' 'qt5-base' 'qt5-multimedia' 'poppler-qt5')
provides=('yacreader' 'yacreader-nopdf')
conflicts=('yacreader' 'yacreader-nopdf')
replaces=('yacreader' 'yacreader-nopdf')
source=("https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
b2sums=('d0746f8b61daa91c3308210fa153cbb2651254d763f4d85803957696adeedbe710b0963c6b36762054dfe7ff16a84023bcb6e31c9807ba2c86c7413ce7543f94')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
}
