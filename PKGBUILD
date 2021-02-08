# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=charmap
pkgver=2021.02.08
pkgrel=1
pkgdesc="Electron app for char maps"
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('electron')
source=("${pkgname}-$pkgver.tar.gz::${url}/releases/download/$pkgver/$pkgname.tar.gz")
sha256sums=('c03741e98bb1aafd39581446e6a9794c922803d8d1372f43f5e7a7b5e72434aa')

package() {
  mkdir -p $pkgdir/usr/bin/
  cp -a $srcdir/usr/bin/charmap $pkgdir/usr/bin/charmap
  mkdir -p $pkgdir/usr/lib
  cp -a $srcdir/usr/lib/charmap $pkgdir/usr/lib/charmap
}
