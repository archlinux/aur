# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.20.0
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')
conflicts=('ckan-git')

source=("${pkgname}-v${pkgver}.exe::https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('4566943a50c92243618a81d3451aa9d00283bc6f4f44257d9f8fd95571d73a70')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-v$pkgver.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}

