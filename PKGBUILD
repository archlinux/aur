# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=r2mod_cli
pkgver=1.2.2
pkgrel=1
pkgdesc="A Risk of Rain 2 Mod Manager."
arch=('any')
url="https://github.com/foldex/r2mod_cli"
license=('GPL3')
depends=('curl' 'gawk' 'jq' 'p7zip' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b3da00030d1c7c2c860f6cce9bd9a4dc882a53e3c0ce0e4a1f42af1f07442822')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
