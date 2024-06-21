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
sha256sums=('14b28a19286639a5444db307ac08041cfa9594be3d576dabe5d1b5184262de06')

package() {
  cd "${srcdir}/"
  install -o root -g root -m 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
