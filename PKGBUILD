# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rtimelog
pkgver=0.3.6
pkgrel=1
pkgdesc="Rust program to track working hours and calculate surplus using SQLite"
arch=('x86_64')
url="https://github.com/umpire274/rtimelog"
license=('MIT')
depends=()
provides=('rtimelog')
conflicts=('rtimelog')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rtimelog-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('31eef8ca826db6394e94eebe00bd78fd38a94b454a6db679cbc1a8c11c126120')

# keywords=('time' 'timelog' 'tracking' 'logger' 'cli' 'rust' 'productivity' 'worklog' 'timesheet' 'task' 'management')

package() {
  install -Dm755 "$srcdir/rtimelog" "$pkgdir/usr/bin/rtimelog"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

