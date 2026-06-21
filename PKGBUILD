# Maintainer: Bartosz Fenski <bartosz at fenski dot pl>
pkgname=nasty-top-bin
pkgver=0.0.8
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
sha256sums_x86_64=('d5791dd8bce9a5417988a36e1cb3038e0bf45f5a562f899abc480747c2e9c8c5')
sha256sums_aarch64=('b25f47e72d285f2961d0422d1aa260395b162f544bda5aed83a5d325cb977e8f')

package() {
  install -Dm755 "$srcdir/nasty-top" "$pkgdir/usr/bin/nasty-top"
}
