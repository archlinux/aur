# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=r2mod_cli
pkgver=1.0.7
pkgrel=1
pkgdesc="A Risk of Rain 2 Mod Manager."
arch=('any')
url="https://github.com/foldex/r2mod_cli"
license=('GPL3')
depends=('curl' 'gawk' 'jq' 'p7zip' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a8d23759a561df6c1264ed08985a21674f072514395027c856bace2160f4a2ff')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
