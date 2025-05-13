# deasdavid9@gmail.com
pkgname=attofetch
pkgver=1.0
pkgrel=1
pkgdesc="A pretty minimal, and small in size, fetching tool written in bash."
arch=('any')
url="https://github.com/davyidx/attofetch"
license=('MIT')
depends=('bash')
source=("attofetch" "attoscript.sh" "ascii.txt")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # Launcher installation:
  install -Dm755 "$srcdir/attofetch" "$pkgdir/usr/bin/attofetch"

  # Attofetch installation:
  install -Dm755 "$srcdir/attoscript.sh" "$pkgdir/usr/share/attofetch/attoscript.sh"
  install -Dm644 "$srcdir/ascii.txt" "$pkgdir/usr/share/attofetch/ascii.txt"
}
