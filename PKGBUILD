# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.22.3
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')
conflicts=('ckan-git')

source=("${pkgname}-v${pkgver}.exe::https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('8b02bb62f9786a9f3a764594d4a3297c73bc5d476099afcf48a4fa14b56a1204')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-v$pkgver.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}

