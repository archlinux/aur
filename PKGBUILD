# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="jolie"
pkgver="1.10.1"
pkgrel=1
pkgdesc="The Jolie programming language"
arch=('i686' 'x86_64')
url="https://www.jolie-lang.org/"
license=('LGPL-2.1')
depends=('jre-openjdk')
source=("https://github.com/jolie/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar")
sha256sums=('e47f3b4d81694752fce64e5ca4f4895909b6e5346e35e8dd65e59b798929140f')

package() {
  mkdir -p "${pkgdir}/usr/lib/"
  java -jar "${pkgname}-${pkgver}.jar" -jh "${pkgdir}/usr/lib/jolie" -jl "${pkgdir}/usr/bin"
}
