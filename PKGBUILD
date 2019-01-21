# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor Max Meyer <dev at [f}edux d0t org>
pkgname=geteltorito
pkgver=0.6
pkgrel=1
pkgdesc="A El Torito boot image extractor"
arch=(any)
url="https://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/geteltorito/geteltorito.pl"
license=('GPL2')
depends=('perl')
changelog=
install="${pkgname}.install"
source=("https://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/${pkgname}-${pkgver}.tar.gz")
noextract=(${pkgname}.pl)
sha256sums=('bb4fab8d4bedee1250762940b9f5d20fc7ac29fb2b5e9767c6af0a0955aa6bbe')

package() {
  cd "${srcdir}/${pkgname}"
  install -o root -g root -m 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
