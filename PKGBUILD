# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="jolie"
pkgver="1.10.2"
pkgrel=1
pkgdesc="The Jolie programming language"
arch=('i686' 'x86_64')
url="https://www.jolie-lang.org/"
license=('LGPL-2.1')
depends=('jre-openjdk')
source=("https://github.com/jolie/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha256sums=('683d1910accfd1d5afcd4ea2806ce2a2b393de5e8a4cd2a289e03ef3bdcfa098')

package() {
  mkdir -p "${pkgdir}/usr/lib/"
  java -jar "${pkgname}-${pkgver}.jar" -jh "${pkgdir}/usr/lib/jolie" -jl "${pkgdir}/usr/bin"
}
