# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='bingoo'
pkgver=1.0.3
pkgrel=1
pkgdesc="Generate bingo images from plain text"
arch=('x86_64')
url=https://git.mylloon.fr/Anri/bingoo
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=("$pkgname::https://git.mylloon.fr/Anri/bingoo/releases/download/$pkgver/bingoo__linux")
sha256sums_x86_64=("SKIP")

package() {
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
