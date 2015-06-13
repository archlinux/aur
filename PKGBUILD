# Maintainer: procrastinator

pkgname=ttf-essays
pkgver=2.001
pkgrel=2
pkgdesc="A font based on the typeface used in a 1743 English translation of Montaigne's Essays."
arch=('any')
license=('LGPL')
url="http://www.thibault.org/fonts/essays/"
install=ttf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
source=("http://www.thibault.org/fonts/essays/essays1743-$pkgver-1-ttf.tar.gz")
sha256sums=('83a293f52dc0767adc5c57c619d99db0a5e1ba6fcdfa240ca719aa5643f10c5d')

build() {
  /bin/true
}

package() {
  cd "$srcdir/essays1743"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
