# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=alescript
pkgver=1.1
pkgrel=1
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/alescript"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/aleScript-main/releases/download/$pkgver/alescript.tar.gz")
sha256sums=('cd25938456b5c4f950197a5047aafd79024703294857835787b8d0d015875b37')

package() {
    install -Dm755 "$srcdir/alescript/alescript" "$pkgdir/usr/bin/alescript"
}
