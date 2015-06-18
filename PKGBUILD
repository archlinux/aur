# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=jpmidi
pkgver=0.2
pkgrel=4
pkgdesc="SMF player for JACK MIDI with transport sync"
arch=(i686 x86_64)
url="http://juliencoder.de/jpmidi/"
license=('GPL')
depends=('jack' 'glib2' 'readline')
source=(http://juliencoder.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d9ce048a26b879a2eb0c6074c0124be0')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install
}

# vim:set ts=2 sw=2 et:
