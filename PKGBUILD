# Maintainer: rustemb <rustemb@systemli.org>
pkgname=profetch
pkgver=0.1.6
pkgrel=1
pkgdesc="System Information Fetcher Written in GNU/Prolog "
arch=(any)
url="https://github.com/RustemB/profetch"
license=('GPL3')
depends=(glibc)
makedepends=(gprolog)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('60860feaac5702e6677d51ed6662490c')

build() {
    cd "$pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
