# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=kalker-bin
_pkgname=kalker
pkgver=2.2.2
pkgrel=1
pkgdesc="Kalker/kalk is a calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals"
arch=('x86_64')
url="https://kalker.xyz/"
license=('MIT')
provides=('kalker')
conflicts=('kalker' 'kalker-git')
options=(!strip)
source=("$_pkgname-$pkgver::https://github.com/PaddiM8/kalker/releases/download/v$pkgver/$_pkgname-linux")
sha256sums=('f036bc3584d85408ad8d0ba29a5f05f931874024c5da05bb3f5ec7eb9857a57c')

package() {
  # Install binary and launch script
  install -Dm755 -T "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
