pkgname=killport
pkgver=1.0.0
pkgrel=1
pkgdesc="Forcefully kill a process listening on a specified port"
arch=('any')
url="https://github.com/fayez-nazzal/killport"
license=('MIT')
depends=('lsof')
source=("killport.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/killport.sh" "$pkgdir/usr/bin/killport"
}