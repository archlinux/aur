# Maintainer: Eric Lemieux <eric at lemieuxdev dot com>

pkgname='dank-bin'
pkgver='2.2.2'
pkgrel='1'
pkgdesc='Download memes from reddit in parallel so that you can more efficiently waste time.'
url='https://github.com/EricLemieux/dank'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs' 'openssl')
provides=('dank')
conflicts=('dank')
source=("https://github.com/EricLemieux/dank/releases/download/v${pkgver}/dank-v${pkgver}-${CARCH}-linux.tar.gz")
sha256sums=('2cd9d0e19613bc7ab05c1d553800ee56d3b040a95ff8545d19e90128a875de00')

package() {
  install -Dm 755 "$srcdir/dank" "$pkgdir/usr/bin/dank"
}

