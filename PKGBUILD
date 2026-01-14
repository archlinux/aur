# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('2a3d48d57862a8f7e2c7531413e7bef1f3f51075c35bc40107525d6b4f63ae2a')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
