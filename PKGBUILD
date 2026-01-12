# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=treadlate
pkgdesc="translate adn read books. this is one of the ankor runners app"
pkgver=v0.0.3
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/treadlate"
license=('MIT')
depends=()
makedepends=('git')
source=("git+https://github.com/pumenis/treadlate.git#tag=v0.0.3")
sha256sums=('c14a27df0cf905b43d59a97f9d037d2af3d8eade0987f312231f54dc5c0a2e3a')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/share/treadlate/
    cp * ${pkgdir}/usr/share/treadlate/
}
