# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=3.0.2
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('80ffb668e989b976b8ca3e1d42cfd8187f577a4c041123790d2e90217eaeceda')

package() {
  cd "utfcpp-${pkgver}/source"
  install -d "${pkgdir}/usr/include"
  for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/include/${i}"; done
}
