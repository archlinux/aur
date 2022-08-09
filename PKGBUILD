# Maintainer: Nguyen Hong Hiep (justanoobcoder)
# Github: https://github/justanoobcoder

pkgname=nmtool
pkgver=1.0
pkgrel=1
pkgdesc="A CLI tool for managing hotspot using nmcli."
arch=(any)
url="https://github.com/justanoobcoder/nmtool"
license=('GPL3')
makedepends=('make' 'gcc')
depends=('dnsmasq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(8a8af9a25b98c0770718059bc57269f9)

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
