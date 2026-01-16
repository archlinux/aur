# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('c81a1cbf0303caa8a75ae1781b44b976a109454a99e2b662979917115cb00cd5')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
