# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=openproject-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line client for OpenProject API v3"
arch=('any')
url="https://github.com/decent-tools-for-thought/openproject-cli"
license=('custom:unknown')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e13702746257695a6e4e2122474cdd489cdda8807dc1a94b7d64046798d46554')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 openproject_cli.py "$pkgdir/usr/bin/openproject-cli"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
