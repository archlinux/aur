pkgname=aur-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="aur package manager"
arch=('any')
url="https://github.com/oriten1223221/aur"
license=('MIT')
depends=('bash')
source=("aur")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/aur" "$pkgdir/usr/bin/aur"
}
