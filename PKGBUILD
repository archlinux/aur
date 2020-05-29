# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.6.2.1909283
_rel=7.23
pkgrel="$_rel"
pkgdesc='A comic reader for cross-platform reading and managing your digital comic collection.(using rpm package to speed up installation.)'
arch=('x86_64')
url='http://www.yacreader.com'
license=('GPL3')
depends=('libunarr' 'qt5-base' 'qt5-multimedia' 'poppler-qt5')
provides=('yacreader' 'yacreader-nopdf')
conflicts=('yacreader' 'yacreader-nopdf')
replaces=('yacreader' 'yacreader-nopdf')
source=("https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
b2sums=('475b4d65810be45e99d4e0c0f8d4ed13e6c1511d71ce470d1c6439ee70408592f410906a13ab675b44d51f50dc671754e1731bb5bed375386d334536d01dc876')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
}
