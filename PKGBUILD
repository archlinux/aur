# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Anonymous <fegdri@gmail.com>

pkgname=festvox-ru
pkgver=0.5
pkgrel=4
pkgdesc="Russian support for Festival."
arch=('any')
url="https://launchpad.net/ubuntu/+source/festvox-ru"
depends=('festival')
makedepends=()
license=('BSD')
install=festvox-ru.install
source=(https://launchpad.net/ubuntu/+archive/primary/+files/festvox-ru_${pkgver}%2Bdfsg.orig.tar.bz2)
md5sums=('ded572f715cfd58e62d4bc380eb64c48')

package() {
  cd "$srcdir"/msu_ru_nsh_clunits
  mkdir -p "$pkgdir"/usr/share/festival/voices/russian/msu_ru_nsh_clunits
  mv * "$pkgdir"/usr/share/festival/voices/russian/msu_ru_nsh_clunits
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  mv "$pkgdir"/usr/share/festival/voices/russian/msu_ru_nsh_clunits/COPYING "$pkgdir"/usr/share/licenses/$pkgname/
}
