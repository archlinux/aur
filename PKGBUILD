# Maintainer: Bartosz Fenski <bartosz at fenski dot pl>
pkgname=nasty-top-bin
pkgver=0.0.4
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
sha256sums_x86_64=('5db5b971be041bfeb26de90a7d4314707c148d688c52c28aa933d99bff5999d8')
sha256sums_aarch64=('b214be9e432b583c2e334fc6e027e2d29c16a6f4e750d1882fe15ef05e23e8f7')

package() {
  install -Dm755 "$srcdir/nasty-top" "$pkgdir/usr/bin/nasty-top"
}
