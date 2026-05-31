# Maintainer: Bartosz Fenski <bartosz at fenski dot pl>
pkgname=nasty-top-bin
pkgver=0.0.6
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
sha256sums_x86_64=('90d35f8e457f3db3e585ac2039d453e9e5100ba4cce8cbc450b561877a2f6697')
sha256sums_aarch64=('cc71a81a0d38c306d14f606236e08044a1bcdf34530005aac46faa1528e4a43e')

package() {
  install -Dm755 "$srcdir/nasty-top" "$pkgdir/usr/bin/nasty-top"
}
