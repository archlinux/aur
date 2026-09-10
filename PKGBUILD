# Maintainer: Bartosz Fenski <bartosz at fenski dot pl>
pkgname=nasty-top-bin
pkgver=0.0.10
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
sha256sums_x86_64=('d8bca92580126c8de513129dd45ded2ab5608b00d518e245b4f6e169d4d5a65d')
sha256sums_aarch64=('bec3c4e8a2595a050068af3006df15f4cdb68612c52161d51aba395bcfc47cc9')

package() {
  install -Dm755 "$srcdir/nasty-top" "$pkgdir/usr/bin/nasty-top"
}
