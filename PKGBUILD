# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=kalker-bin
_pkgname=kalker
pkgver=2.0.4
pkgrel=1
pkgdesc="Kalker/kalk is a calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals"
arch=('x86_64')
url="https://kalker.xyz/"
license=('MIT')
provides=('kalker')
conflicts=('kalker' 'kalker-git')
options=(!strip)
source=("$_pkgname-$pkgver::https://github.com/PaddiM8/kalker/releases/download/v$pkgver/$_pkgname-linux")
sha256sums=('84770659da12692599b9fe858b317467c85ee569e9205613c3239487e6236bc9')

package() {
  # Install binary and launch script
  install -Dm755 -T "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
