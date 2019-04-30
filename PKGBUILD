# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=3.1
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('ab531c3fd5d275150430bfaca01d7d15e017a188183be932322f2f651506b096')

package() {
  cd "utfcpp-${pkgver}/source"
  install -d "${pkgdir}/usr/include"
  for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/include/${i}"; done
}
