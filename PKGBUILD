# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=kalker-bin
_pkgname=kalker
pkgver=2.0.3
pkgrel=1
pkgdesc="Kalker/kalk is a calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals"
arch=('x86_64')
url="https://kalker.xyz/"
license=('MIT')
provides=('kalker')
conflicts=('kalker' 'kalker-git')
options=(!strip)
source=("$_pkgname::https://github.com/PaddiM8/kalker/releases/download/v$pkgver/$_pkgname-linux")
sha256sums=('a51a7c63d60bf48e314cc20a49d056918a9d84c9a528386c382ffb42d01341f8')

package() {
  # Install binary and launch script
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname"
}
