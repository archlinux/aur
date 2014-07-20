# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=bmdcapture
pkgver=1.0.4
pkgrel=1
pkgdesc="A capture utility for BlackMagic Design DeckLink cards"
arch=('i686' 'x86_64')
url="http://smorgasbork.com/"
license=('GPL3')
depends=('decklink' 'gcc-libs' 'libgl')
source=("http://smorgasbork.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('af6eae97baba24b9c007ba930ac09e57ca3df75998a7becd1d0f38d6c75380aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 bmdcapture "$pkgdir/usr/bin/bmdcapture"
}

# vim:set ts=2 sw=2 et:
