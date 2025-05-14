# deasdavid9@gmail.com
pkgname=attofetch
pkgver=1.2
pkgrel=2
pkgdesc="A pretty minimal, and small in size, fetching tool written in bash."
arch=('any')
url="https://github.com/davyidx/attofetch"
license=('MIT')
depends=('bash')
source=("attofetch" "attofetch.sh" "attofetch.cfg" "ascii.txt")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Launcher installation:
  install -Dm755 "$srcdir/attofetch" "$pkgdir/usr/bin/attofetch"

  # Attofetch installation:
  install -Dm755 "$srcdir/attofetch.sh" "$pkgdir/usr/share/attofetch/attofetch.sh"
  install -Dm644 "$srcdir/ascii.txt" "$pkgdir/usr/share/attofetch/ascii.txt"

  # Configuration file installation:
  install -Dm644 "$srcdir/attofetch.cfg" "$pkgdir/etc/attofetch.cfg"
}
