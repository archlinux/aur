# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-mplayer
pkgver=0.2
pkgrel=1
pkgdesc="Simple frontend for mplayer and Milena speech synthesizer"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
depends=('milena' 'mplayer')
source=(milena_mplayer.sh)
sha256sums=('025cc95f048a2d658962e124af800c1eae45e212640c35e3ce74bcd961a3d998')

package() {
  install -Dm 755 -v "$srcdir/milena_mplayer.sh" "$pkgdir/usr/bin/milena_mplayer"
}

# vim:set ts=2 sw=2 et:
