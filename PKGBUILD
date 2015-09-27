# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.14.3
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')
conflicts=('ckan-git')

source=("https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('4fb28aec82e6d7f48b3326aac5dd875a94a37e089803dd3af385b4f501faab4f')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/ckan.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}


