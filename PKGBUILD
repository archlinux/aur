pkgname=tuxxy
pkgver=1.0.0
pkgrel=1
pkgdesc="Bash script that fetches aur packages and installs them."
arch=('any')
url="https://github.com/TuxxyThePenguin/tuxxy"
license=('GNU GPLv3-or-later')
depends=('git' 'base-devel')
makedepends=('git')
source=("tuxxy.sh")
sha256sums=('SKIP')

install() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/tuxxy.sh" "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

package() {
  install -Dm755 "$srcdir/tuxxy.sh" "$pkgdir/usr/bin/$pkgname"
}
