# Maintainer: David Adler <d.adler@posteo.de>
pkgname=jpmidi
pkgver=0.21
pkgrel=5
pkgdesc="SMF player for JACK MIDI with transport sync"
arch=('x86_64')
url="https://github.com/jerash/jpmidi"
license=('GPL')
depends=('jack' 'glib2' 'readline')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('6f0484be7dc55d5de88d7532048dd2cb')

build() {
    cd $pkgname-$pkgver/$pkgname
    ./configure --prefix="$pkgdir/usr"
    make
}

package() {
    cd $pkgname-$pkgver/$pkgname
    make install
}

