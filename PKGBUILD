# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.5.0
_rel=3.153
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
sha256sums=('d850260205f570361ef15f641d303cf6b06d9e7590db26805e95907f1f9b94c3')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
}
