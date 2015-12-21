# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=sjk
pkgver=0.3.8
pkgrel=1
pkgdesc="Swiss Java Knife is CLI tool for JVM diagnostic, troubleshooting and profiling"
arch=('any')
url='https://github.com/aragozin/jvm-tools'
license=('APACHE')
depends=('java-environment')
source=("https://bintray.com/artifact/download/aragozin/generic/${pkgname}.jar"
        "sjk")
sha256sums=('f72b706f700552f27202cf2b4d5fcaeeafd7ebb83f2339fbebfd560f7d884521'
            '62d6e80ec8d66bd2b68760599d5b2320910d961405d85560de09481bbfb0d7c0')

package() {
  install -m644 -D "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -m755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

