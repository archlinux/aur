# deasdavid9@gmail.com
pkgname=attosfetch
pkgver=1.0
pkgrel=1
pkgdesc="A pretty minimal, and small in size, fetching tool written in bash."
arch=('any')
url="https://github.com/davyidx/attosfetch"
license=('Unlicense')
depends=('bash')
source=("attosfetch" "attosfetch.sh" "attosfetch.conf" "ascii.txt" "skull.txt")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Launcher installation:
  install -Dm755 "$srcdir/attosfetch" "$pkgdir/usr/bin/attosfetch"

  # Attofetch installation:
  install -Dm755 "$srcdir/attosfetch.sh" "$pkgdir/usr/share/attosfetch/attosfetch.sh"
  install -Dm644 "$srcdir/ascii.txt" "$pkgdir/usr/share/attosfetch/ascii.txt"
  install -Dm644 "$srcdir/skull.txt" "$pkgdir/usr/share/attosfetch/skull.txt"

  # Configuration file installation:

  install -Dm644 "$srcdir/attosfetch.conf" "$pkgdir/etc/attosfetch.conf"
}
