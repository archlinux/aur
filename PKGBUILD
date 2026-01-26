# Maintainer: Pumenis <mindia dot e at aol dot com>
pkgname=treadlate
pkgdesc="translate adn read books. this is one of the ankor runners app"
pkgver=v0.0.4
pkgrel=0
arch=('x86_64')
url="https://github.com/pumenis/treadlate"
license=('MIT')
depends=()
makedepends=('git')
source=("git+https://github.com/pumenis/treadlate.git#tag=v0.0.4")
sha256sums=('e6869a92fbbe5f1e172f5e22ecd0c77b8fe9b3e536ca3592392debf18ca8d471')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags
}

package() {
    cd "$srcdir/$pkgname"
    install -d ${pkgdir}/usr/share/treadlate/
    cp -r * ${pkgdir}/usr/share/treadlate/
}
