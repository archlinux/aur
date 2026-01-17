# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('826f7453e1d442e7b9a3fb7140bd2b152ec0c83478095d65bd4f789b4ac5d24e')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
