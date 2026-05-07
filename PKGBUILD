# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=alescript
pkgver=1.3
pkgrel=1
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/alescript"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/aleScript-main/releases/download/$pkgver/alescript.tar.gz")
sha256sums=('b6585379694c99ef51458a296f32b8d7ac55e90b46d78feb2f2c94c3f577c453')

package() {
    install -Dm755 "$srcdir/alescript/alescript" "$pkgdir/usr/bin/alescript"
}
