# Maintainer: Eric Lemieux <eric at lemieuxdev dot com>

pkgname='dank-bin'
pkgver='v2.2.1'
pkgrel='1'
pkgdesc='Download memes from reddit in parallel so that you can more efficiently waste time.'
url='https://github.com/EricLemieux/dank'
license=('Apache')
arch=('x86_64')
provides=('dank')
source=("https://github.com/EricLemieux/dank/releases/download/${pkgver}/dank-linux.tar.gz")
sha256sums=('e79a6a0de3bc6f3994ce8e4b546e463a8320e80e5adc78f071733320b0b4f1b3')

package() {
  install -Dm 755 "$srcdir/dank" "$pkgdir/usr/bin/dank"
}

