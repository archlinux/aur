# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor Max Meyer <dev at [f}edux d0t org>
pkgname=geteltorito
pkgver=0.6
pkgrel=1
pkgdesc="A El Torito boot image extractor"
arch=(any)
url="https://github.com/rainer042/geteltorito/blob/main/geteltorito.pl"
license=('GPL2')
depends=('perl')
changelog=
install="${pkgname}.install"
source=("https://github.com/rainer042/geteltorito/blob/main/geteltorito.pl")
noextract=(${pkgname}.pl)
sha256sums=('f1d03a5c295546adc62b2758cfc2327cacae01ba994bb8f522c3779226d915cf')

package() {
  cd "${srcdir}/"
  install -o root -g root -m 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
