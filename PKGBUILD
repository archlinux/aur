# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=libunarr-bin
_pkgname=libunarr
pkgver=1.0.1
_rel=4.184
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
b2sums=('ebfc77f2c733e50baaaf3e7b0680225aaacd0272b5d377837df2aa9f24af5de4073afb8691fc0ecc4ee9e8182f629bf47c9c110920123d79d7492d1a542170ef')

package() {
    cd "$srcdir"
    rm -r "$srcdir"/usr/lib
    cp -a usr "$pkgdir"/
    mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
    
}
