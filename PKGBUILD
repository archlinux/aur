# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('9d00651bc783890e8e981e65b15b47f58e8af474f5aa79aeb3b466d6f09ea8b3')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
