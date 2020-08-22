# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.6.2.1909283
_rel=7.43
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
b2sums=('7ee924902f73108131b1c0ea422eaeface5ad3bcf69557f84adf1ce320bc28ff57716cbc8aab3d2d05c31afdc22780aae365198c6105778af1e3503c793ccca7')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
}
