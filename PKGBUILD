# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
conflicts=('wordgen')
provides=('wordgen')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/wordgen-$pkgver-linux-amd64.tar.gz")
sha256sums=('91bbc80ffa39ea7dbcd39d788b04e3f803802d4905cf4e7a8e9851604d14189e')

package() {
  cd "$srcdir/wordgen-$pkgver-linux-amd64"

  install -Dm755 ./wordgen -t "$pkgdir/usr/bin/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/wordgen/"
}
