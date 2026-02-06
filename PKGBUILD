# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=alescript
pkgver=1.2
pkgrel=1
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/alescript"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/aleScript-main/releases/download/$pkgver/alescript.tar.gz")
sha256sums=('84ad4e559559b159ec46e85c696dc288e2d4460a037e5e79c005c8bf1840457f')

package() {
    install -Dm755 "$srcdir/alescript/alescript" "$pkgdir/usr/bin/alescript"
}
