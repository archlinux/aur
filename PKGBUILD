# Maintainer: Bartosz Fenski <bartosz at fenski dot pl>
pkgname=nasty-top-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="A top-like TUI for bcachefs filesystems"
arch=('x86_64' 'aarch64')
url="https://github.com/nasty-project/nasty-top"
license=('GPL-3.0-only')
provides=('nasty-top')
conflicts=('nasty-top')
optdepends=('bcachefs-tools: required for reconcile status view')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/nasty-top-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/nasty-top-aarch64-linux.tar.gz")
sha256sums_x86_64=('6777a765a10c29e451ef41a40db57622b2c411ba4ae851fb42f76c2d2aebd734')
sha256sums_aarch64=('44ef35ca32d862926b4abbdafbb81075f702cec26abdc6e8027e0201d8e91fca')

package() {
  install -Dm755 "$srcdir/nasty-top" "$pkgdir/usr/bin/nasty-top"
}
