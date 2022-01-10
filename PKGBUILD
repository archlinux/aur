# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=polymc-curseforge
pkgver=1.4.1
pkgrel=1
pkgdesc="Adds support for Curseforge's Install button to PolyMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/linux.tar.gz)
sha512sums=('bca58aa31798a44d518b669d3c8bb4d4d15dbe285652daa692db11693eee552750622d4a47ae7bd20fba5642b26479523eff5ca9897a1d9165f791ecb213c0f9')
optdepends=('polymc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
