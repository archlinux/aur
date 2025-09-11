# Maintainer: Alessandro Maestri <umpire274@gmail.com>

pkgname=rbackup
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast, cross-platform, multithreaded incremental backup tool (rsync/robocopy-like) written in Rust"
arch=('x86_64')
url="https://github.com/umpire274/rbackup"
license=('MIT')
depends=()
provides=('rbackup')
conflicts=('rbackup')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rbackup-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d949de73ae209bc8b9f76133281697819b706583e60415a1bca0ad896d588461')

# Keywords: backup, incremental, rust, rsync, robocopy, multithreaded, portable, cli

package() {
  install -Dm755 "$srcdir/rbackup" "$pkgdir/usr/bin/rbackup"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

