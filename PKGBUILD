# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('9f40a4b31efef0d2407496eba673c0ee108c8544c074074af7c03cbad5d896f4')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
