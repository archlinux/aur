# Maintainer: Bolt J Woofson <https://github.com/Woofson>
pkgname=dotmatrix-git
pkgver=3.0.1.r0.g8fb1ae5
pkgrel=1
pkgdesc="Dot Matrix (renamed to DotDog) - Modern dotfile compositor with git versioning & DotDog TUI"
arch=('x86_64')
url="https://github.com/Woofson/dotdog"
license=('MIT')
depends=('dotdog-git')
provides=('dotmatrix')
conflicts=('dotmatrix')

package() {
    # Transitional package pointing to dotdog
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    echo "Dot Matrix has been renamed to DotDog. Please install 'dotdog-git'." > "$pkgdir/usr/share/doc/$pkgname/README"
}
