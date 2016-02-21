# Maintainer: Blackleg <blackleg at openaliasbox dot org>
# Based in ckan package 
# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=netkan
pkgver=1
pkgrel=0
pkgdesc='To inflate a NetKAN file into a CKAN file, simply give it as an argument to the netkan.exe executable.'
arch=('any')
url="https://github.com/KSP-CKAN/NetKAN"
license=('MIT')
depends=('curl' 'mono')

source=("${pkgname}-v${pkgver}.exe::https://ckan-travis.s3.amazonaws.com/${pkgname}.exe")
sha256sums=('be02cdbd0a1e1012bdfa54da65d68ad9d496765f4efacc5162d96b065ab898ce')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname-v$pkgver.exe" "$pkgdir/usr/bin/netkan"
  chmod 755 "$pkgdir/usr/bin/netkan"
}

