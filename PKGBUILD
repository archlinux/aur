# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.16.0
pkgrel=2
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')
conflicts=('ckan-git')

source=("${pkgname}-v${pkgver}.exe::https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('15c0c4a2fe876a560a53d0c706e0398bbc0e8058c355d7fa31e12c66acad4ca0')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-v$pkgver.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}

