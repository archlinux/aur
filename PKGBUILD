# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=bmdcapture
pkgver=0.9.6
pkgrel=1
pkgdesc="A capture utility for BlackMagic Design DeckLink cards"
arch=('i686' 'x86_64')
url="http://smorgasbork.com/"
license=('GPL3')
depends=('decklink' 'gcc-libs' 'libgl')
source=("http://smorgasbork.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f7eca44c702cc2ebd9afcb435bea800f1c73e4beeac7b0c337680dff0372fe64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 bmdcapture "$pkgdir/usr/bin/bmdcapture"
}

# vim:set ts=2 sw=2 et:
