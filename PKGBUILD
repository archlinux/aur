# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=bmdcapture
pkgver=1.0.1
pkgrel=1
pkgdesc="A capture utility for BlackMagic Design DeckLink cards"
arch=('i686' 'x86_64')
url="http://smorgasbork.com/"
license=('GPL3')
depends=('decklink' 'gcc-libs' 'libgl')
source=("http://smorgasbork.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0a119642dba521c0af0b21c6959208f8bb29a9337d17105d71bdb5a109372410')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 bmdcapture "$pkgdir/usr/bin/bmdcapture"
}

# vim:set ts=2 sw=2 et:
