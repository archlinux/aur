# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.8.4
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')

source=("https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('30d6e9e7337c9e427dfd62ccabbfa25585a58555291b3dbeede89223bb6b578a')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/ckan.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}


