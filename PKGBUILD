# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor Max Meyer <dev at [f}edux d0t org>
pkgname=geteltorito
pkgver=0.6
pkgrel=1
pkgdesc="A El Torito boot image extractor"
arch=(any)
url="https://raw.githubusercontent.com/rainer042/geteltorito/main/geteltorito.pl"
license=('GPL2')
depends=('perl')
changelog=
install="${pkgname}.install"
source=("https://raw.githubusercontent.com/rainer042/geteltorito/main/geteltorito.pl")
noextract=(${pkgname}.pl)
sha256sums=('378a6305edb9397978e60b7908a85dd8c2546f2808cb845552d5e4a8ba9baab3')

package() {
  cd "${srcdir}/"
  install -o root -g root -m 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
