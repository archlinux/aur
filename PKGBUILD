# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=bmdcapture
pkgver=0.9.6
pkgrel=1
pkgdesc="BlackMagic Design DeckLink capture utility"
arch=('i686' 'x86_64')
url="http://smorgasbork.com/"
license=('GPL')
depends=('gcc-libs' 'libgl')
source=("http://smorgasbork.com/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4dec7596cfa6c9e7d835e312a6136c8d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m0755 bmdcapture "$pkgdir/usr/bin/bmdcapture"
}

# vim:set ts=2 sw=2 et:
