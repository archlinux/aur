# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=3.0.1
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('cc70073645be54efcc7019fc466dbaae0832d4a3afaf5e8519c5b27ba42ac02c')

package() {
  cd "utfcpp-${pkgver}/source"
  install -d "${pkgdir}/usr/include"
  for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/include/${i}"; done
}
