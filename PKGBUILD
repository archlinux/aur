# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("https://github.com/ripytide/metapac/releases/download/v$pkgver/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('fec53aaf25f51bde05ff3b15211fd70dc4f47c328b17611a87edc7c131ece13a')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "$pkgdir/usr/bin"
}
