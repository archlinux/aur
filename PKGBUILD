# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=2.3.5
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('f3ffe0ef6c02f48ebafe42369cbd741e844143baad27c13baad1cd14b863983d')

package() {
  cd "utfcpp-${pkgver}/source"
  install -d "${pkgdir}/usr/include"
  for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/include/${i}"; done
}
