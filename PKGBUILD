# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="jolie"
pkgver="1.10.5"
pkgrel=2
pkgdesc="The Jolie programming language"
arch=('i686' 'x86_64')
url="https://www.jolie-lang.org/"
license=('LGPL-2.1')
depends=('jre-openjdk')
source=("https://github.com/jolie/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha256sums=('1088c357838c58f132c1d17598d5841e63e5dccb0ea518a2cd9aa281def7d92d')

package() {
  mkdir -p "${pkgdir}/usr/lib/"
  java -jar "${pkgname}-${pkgver}.jar" -jh "${pkgdir}/usr/lib/jolie" -jl "${pkgdir}/usr/bin"
}
