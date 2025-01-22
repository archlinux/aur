# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor Max Meyer <dev at [f}edux d0t org>
pkgname=geteltorito
pkgver=0.6
pkgrel=2
pkgdesc="A El Torito boot image extractor"
arch=(any)
url="https://raw.githubusercontent.com/rainer042/geteltorito/main/geteltorito.pl"
license=('GPL2')
depends=('perl')
changelog=
install="${pkgname}.install"
source=("https://raw.githubusercontent.com/rainer042/geteltorito/main/geteltorito.pl")
noextract=(${pkgname}.pl)
sha256sums=('97bc0b45189937058608a23d888510cfb7324985baa620c6348a9b78b88d22dc')

package() {
  cd "${srcdir}/"
  install -vDm 755 -D ${pkgname}.pl "$pkgdir/usr/bin/${pkgname}.pl" 
}

# vim:set ts=2 sw=2 et:
