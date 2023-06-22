# Maintainer: robertfoster

pkgname=jflap
pkgver=7.1
pkgrel=3
pkgdesc="Software to learning the basic concepts of Formal Languages and Automata Theory"
arch=('any')
url="http://www.jflap.org/"
license=('CCPL')
noextract=("JFLAP${pkgver}.jar")
depends=('java-runtime')
source=(
  "http://www2.cs.duke.edu/csed/jflap/jflaptmp/july27-18/JFLAP${pkgver}.jar"
  "${pkgname}.sh"
  "${pkgname}.desktop"
  "${pkgname}.png"
)

package() {
  cd ${srcdir}

  install -Dm644 "JFLAP${pkgver}.jar" \
    "${pkgdir}/opt/jflap/JFLAP.jar"
  install -Dm755 "${pkgname}.sh" \
    "${pkgdir}/usr/bin/jflap"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
sha256sums=('a22c095ddc56b18163e8ebeeef165b3a04cb570f35eb46b96105166e06c99406'
            'b307592bda3aeb08ec3c07f33d89884e37da59daa0d81a9756b47f2e2a15e43c'
            '2fec4a0d6b3b99216c28c404f38cb1ec06198eb7c610f7a814902b6fff302a77'
            '67b7714c0b93b614a9821f2f1bb383f72ca364d28a33b0f3a34072d8f8d6dbcc')
