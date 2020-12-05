# Maintainer: rustemb <rustemb@systemli.org>
pkgname=profetch
pkgver=0.1.0
pkgrel=2
pkgdesc="System Information Fetcher Written in GNU/Prolog "
arch=(any)
url="https://github.com/RustemB/profetch"
license=('GPL3')
depends=(glibc)
makedepends=(gprolog)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('de7ad85d1ee2987bdf83ae426631904e')

build() {
    cd "$pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
