# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=libunarr-bin
_pkgname=libunarr
pkgver=1.0.1
_rel=4.193
pkgrel="$_rel"
pkgdesc='A comic reader for cross-platform reading and managing your digital comic collection, using upstream binary.'
arch=('x86_64')
url='http://www.yacreader.com'
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'poppler-qt5')
provides=('libunarr' 'libunarr-git')
replaces=('libunarr' 'libunarr-git')
provides=('libunarr' 'libunarr-git')
source=("https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
b2sums=('fb3cb33dc20d2469f085b29e622af5aa9a54fb00daebd37deb3082a4bd96aa87a68f4072d5cc871cc211f7a56236db6b92b79c0eb14d5eac24249cda385bf307')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
    mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
    
}
