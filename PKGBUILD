# Maintainer: modula t. <defaultxr at pm dot me>

pkgname=deprioritize-makepkg
pkgver=1
pkgrel=2
pkgdesc="Add a line to makepkg to deprioritize the build process."
arch=(any)
license=('GPL3')
depends=('bash' 'grep' 'sed')
groups=()
makedepends=()
source=()
md5sums=()

prepare() {
    cd
}

build() {
    cd
}

package() {
    cd "$pkgdir/.."
    mkdir -p "$pkgdir/usr/bin/"
    cp add-deprioritization-to-makepkg "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/add-deprioritization-to-makepkg"
    mkdir -p "$pkgdir/etc/pacman.d/hooks/"
    cp makepkg-deprioritize.hook "$pkgdir/etc/pacman.d/hooks/"
}
