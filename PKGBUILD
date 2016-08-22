# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=sjk
pkgver=0.4.3
pkgrel=1
pkgdesc="Swiss Java Knife is CLI tool for JVM diagnostic, troubleshooting and profiling"
arch=('any')
url='https://github.com/aragozin/jvm-tools'
license=('APACHE')
depends=('java-environment')
source=("https://bintray.com/artifact/download/aragozin/generic/${pkgname}-${pkgver}.jar"
        "sjk")
sha256sums=('a942d2b7930d3dc082df3546ecb8c65d358b0cbf29c85f6cceb65a394adf26fb'
            '62d6e80ec8d66bd2b68760599d5b2320910d961405d85560de09481bbfb0d7c0')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -m644 -D "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -m755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

