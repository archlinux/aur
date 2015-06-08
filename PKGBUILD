# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
pkgname='java-cobertura'
_pkgname='cobertura'
pkgver='2.1.1'
pkgrel=1
pkgdesc='Cobertura is a free Java tool that calculates the percentage of code accessed by tests'
depends=('java-runtime')
arch=('i686' 'x86_64')
license=('GPL2' 'Apache')
url='http://cobertura.github.io/cobertura/'
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('77876a9a07b5c93387d745d1cfe51f010119ad9c45a2374d38ddcab59aa058fe')


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -Dm644 "${_pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-${pkgver}.jar"

}
