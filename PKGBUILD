# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
provides=('wordgen')
conflicts=('wordgen')
source=("$url/releases/download/v$pkgver/wordgen-v$pkgver-linux-amd64.tar.gz")
sha256sums=('43fe1f03f189a68fe5e753f705174fd27bd82ee8eb32a043ffda6e7b406b8ab2')

package() {
  cd "$srcdir/wordgen-v$pkgver-linux-amd64"

  install -Dm755 ./wordgen -t "$pkgdir/usr/bin/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/wordgen/"
}
