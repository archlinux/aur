# Maintainer: Eric Lemieux <eric at lemieuxdev dot com>

pkgname='dank-bin'
pkgver='v2.2.0'
pkgrel='1'
pkgdesc='Download memes from reddit in parallel so that you can more efficiently waste time.'
url='https://github.com/EricLemieux/dank'
license=('Apache')
arch=('x86_64')
provides=('dank')
source=("https://github.com/EricLemieux/dank/releases/download/${pkgver}/dank-linux.tar.gz")
sha256sums=('faa642e629d4f5c1904cd49e9da65e72bc70abcd4e74cbeb31845ecd346423e9')

package() {
  install -Dm 755 "$srcdir/dank" "$pkgdir/usr/bin/dank"
}

