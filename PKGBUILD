# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=sjk
pkgver=0.23
pkgrel=1
pkgdesc="Swiss Java Knife is CLI tool for JVM diagnostic, troubleshooting and profiling"
arch=('any')
url='https://github.com/aragozin/jvm-tools'
license=('APACHE')
depends=('java-environment')
source=("${pkgname}-${pkgver}.jar::https://repo1.maven.org/maven2/org/gridkit/jvmtool/${pkgname}-plus/${pkgver}/${pkgname}-plus-${pkgver}.jar"
        "sjk")
sha256sums=('6aab07cdf0ecad394e225a1f47d7342cb23bfd8b7d5c65c945f81835363ec937'
            '62d6e80ec8d66bd2b68760599d5b2320910d961405d85560de09481bbfb0d7c0')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -m644 -D "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -m755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

