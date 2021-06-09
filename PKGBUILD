# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="jolie"
pkgver="1.10.4"
pkgrel=1
pkgdesc="The Jolie programming language"
arch=('i686' 'x86_64')
url="https://www.jolie-lang.org/"
license=('LGPL-2.1')
depends=('jre-openjdk')
source=("https://github.com/jolie/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha256sums=('45f4882b9e78dac8728fe75b7ae827799a441b3298c5d2b585ae0d85c5f07fb7')

package() {
  mkdir -p "${pkgdir}/usr/lib/"
  java -jar "${pkgname}-${pkgver}.jar" -jh "${pkgdir}/usr/lib/jolie" -jl "${pkgdir}/usr/bin"
}
