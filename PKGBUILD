# Maintainer mlvzk <mlvzk at protonmail dot com>

pkgname=discocss
pkgver=0.0.1
pkgrel=1
pkgdesc="A tiny Discord css-injector"
url="https://github.com/mlvzk/discocss"
license=("MPL2")
_source=(
    "https://github.com/mlvzk/discocss/archive/master.tar.gz"
)
arch=("x86_64")
_md5sums=(
    "SKIP"
)
depends=(
    "discord"
)

package() {
    cd "$srcdir"
    install -Dm 755 discocss -t "${pkgdir}/usr/bin"
}
