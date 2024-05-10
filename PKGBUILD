# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=kalker-bin
_pkgname=kalker
pkgver=2.2.0
pkgrel=1
pkgdesc="Kalker/kalk is a calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals"
arch=('x86_64')
url="https://kalker.xyz/"
license=('MIT')
provides=('kalker')
conflicts=('kalker' 'kalker-git')
options=(!strip)
source=("$_pkgname-$pkgver::https://github.com/PaddiM8/kalker/releases/download/v$pkgver/$_pkgname-linux")
sha256sums=('3c4fd1fceb917b334c7aa1bf6637dc837d7580bd44ddd7779eda13cf08420404')

package() {
  # Install binary and launch script
  install -Dm755 -T "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
