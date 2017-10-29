# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.22.6
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('mono')
conflicts=('ckan-git')

source=("${pkgname}-v${pkgver}.exe::https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('72a32a7e91fa73e7d7da81f8d3ab7cfb58897c2aa4caded0a57bf1dcc37f537e')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-v$pkgver.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}

