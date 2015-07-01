# Contributor: Luis Miguel García-Cuevas González <luismiguelgcg@gmail.com>
pkgname=ttf-cm-unicode
_realname=cm-unicode
pkgver=0.7.0
pkgrel=2
pkgdesc="Computer Modern Unicode ttf fonts"
arch=('any')
url="http://canopus.iacp.dvo.ru/~panov/cm-unicode/"
license=('custom:OFL1.1')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=ttf.install
#source=(http://downloads.sourceforge.net/project/cm-unicode/cm-unicode/0.7.0/cm-unicode-0.7.0-ttf.tar.xz)
source=(http://downloads.sourceforge.net/project/$_realname/$_realname/$pkgver/$_realname-$pkgver-ttf.tar.xz)
noextract=()
md5sums=('8dc72a959ced139847f4160ff9413fd8')

package() {
  cd "$srcdir/$_realname-$pkgver"
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m644 OFL*.txt ${pkgdir}/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
