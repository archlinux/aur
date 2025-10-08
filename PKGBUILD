# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rtimelogger
pkgver=0.5.1
pkgrel=1
pkgdesc="Rust program to track working hours and calculate surplus using SQLite"
arch=('x86_64')
url="https://github.com/umpire274/rtimelogger"
license=('MIT')
depends=()
provides=('rtimelogger')
conflicts=('rtimelogger')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rtimelogger-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('32acf06814f72d912ce6d88342a1b075c8fbe4a1d007c63c47fbbf42e2f9c85c')

# keywords=('time' 'timelog' 'tracking' 'logger' 'cli' 'rust' 'productivity' 'worklog' 'timesheet' 'task' 'management')

package() {
  install -Dm755 "$srcdir/rtimelogger" "$pkgdir/usr/bin/rtimelogger"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

