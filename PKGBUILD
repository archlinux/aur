# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=ckan
pkgver=1.12.0
pkgrel=1
pkgdesc='All you need to find, install, and manage mods for Kerbal Space Program (ksp)'
arch=('any')
url="https://github.com/KSP-CKAN/CKAN/"
license=('MIT')
depends=('curl' 'mono')

source=("https://github.com/KSP-CKAN/CKAN/releases/download/v${pkgver}/ckan.exe")
sha256sums=('7056e1a9f02f25e8592562f9d128a0de02d6bd40e9c0defd8cf165dfec0083cc')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/ckan.exe" "$pkgdir/usr/bin/ckan"
  chmod 755 "$pkgdir/usr/bin/ckan"
}


