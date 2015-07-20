# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.10.3
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')

source=("https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('9771e55ee4463dae33274a233997e0f8aa5a564e0f2fa7a3d092230389c66be1')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/ckan.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}


