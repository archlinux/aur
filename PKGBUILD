# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=sjk
pkgver=0.4.2
pkgrel=1
pkgdesc="Swiss Java Knife is CLI tool for JVM diagnostic, troubleshooting and profiling"
arch=('any')
url='https://github.com/aragozin/jvm-tools'
license=('APACHE')
depends=('java-environment')
source=("sjk.jar::https://bintray.com/artifact/download/aragozin/generic/${pkgname}-${pkgver}.jar"
        "sjk")
sha256sums=('de61af81e073c494cc36b054f98688ac4f4f039a04fda6138fdc2dfc6b67332d'
            '62d6e80ec8d66bd2b68760599d5b2320910d961405d85560de09481bbfb0d7c0')
noextract=('sjk.jar')

package() {
  install -m644 -D "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -m755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

