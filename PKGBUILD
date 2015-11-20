# Maintainer: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=2.3.4
pkgrel=2
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
source=("http://downloads.sourceforge.net/project/utfcpp/utf8cpp_2x/Release%20${pkgver}/utf8_v${pkgver//./_}.zip")
sha1sums=('638910adb69e4336f5a69c338abeeea88e9211ca')

package() {
  cd "${srcdir}/source"
  install -d "${pkgdir}/usr/include"
  for i in $(find . -type f); do install -Dm644 ${i} "${pkgdir}/usr/include/${i}"; done
}
