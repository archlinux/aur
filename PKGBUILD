# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=kff
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple tool for setting up the environment (SDK/Toolchain) and generating projects from templates for Kindle development"
arch=('x86_64')
url="https://github.com/progzone122/kff"
options=(!lto)
license=('GPL-3.0-or-later')
depends=()
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/progzone122/kff/releases/download/$pkgver/kff")
sha256sums=('SKIP')
build() {
  :
}
package() {
  install -Dm755 "$srcdir/kff" "$pkgdir/usr/bin/kff"
}
