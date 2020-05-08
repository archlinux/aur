# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck
pkgver=0.1.8
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal, written in Rust."
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("https://github.com/doums/milcheck/releases/download/v${pkgver}/${pkgname}")
depends=('gcc-libs')
md5sums=('d2e59fd9b1634805ea883f7b1f6ad479')

package() {
  dest="$pkgdir/usr/bin"
  mkdir -p "$dest"
  chmod 755 "$pkgname"
  cp "$pkgname" "$dest"
}
