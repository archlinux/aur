# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=r2mod_cli
pkgver=1.2.0
pkgrel=1
pkgdesc="A Risk of Rain 2 Mod Manager."
arch=('any')
url="https://github.com/foldex/r2mod_cli"
license=('GPL3')
depends=('curl' 'gawk' 'jq' 'p7zip' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('75df2ab7d928a96bacd41313d0c53984a241fe614f13247c23e422371bea10a6')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
