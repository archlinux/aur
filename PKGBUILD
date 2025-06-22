# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Miguel García-Cuevas González <luismiguelgcg@gmail.com>
_base=cm-unicode
pkgname=ttf-${_base}
pkgver=0.7.0
pkgrel=3
pkgdesc="Computer Modern Unicode ttf fonts"
arch=(any)
url="https://canopus.iacp.dvo.ru/~panov/${_base}"
license=(OFL-1.1)
makedepends=()
install=ttf.install
source=(https://downloads.sourceforge.net/project/${_base}/${_base}/${pkgver}/${_base}-${pkgver}-ttf.tar.xz)
md5sums=('8dc72a959ced139847f4160ff9413fd8')

package() {
  cd ${_base}-${pkgver}
  install -Dm 644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm 644 OFL*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
