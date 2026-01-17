# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('f964ed701bcd5554038000dc016a5c0ce3d8e66cbf228fe48ce2ffd4566ad3d0')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
