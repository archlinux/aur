# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor Max Meyer <dev at [f}edux d0t org>
pkgname=geteltorito
pkgver=0.6
pkgrel=1
pkgdesc="A El Torito boot image extractor"
arch=(any)
url="https://api.github.com/repos/rainer042/geteltorito/contents/geteltorito.pl"
license=('GPL2')
depends=('perl')
changelog=
install="${pkgname}.install"
source=("https://api.github.com/repos/rainer042/geteltorito/contents/geteltorito.pl")
noextract=(${pkgname}.pl)
sha256sums=('a3521f0243c9a43cff331337c44a4bdf830d7d7b5331dc458755099b53e14c4a')

package() {
  cd "${srcdir}/"
  install -o root -g root -m 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
