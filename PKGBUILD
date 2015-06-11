# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=procyon-decompiler
pkgver=0.5.28
pkgrel=1
pkgdesc='A Java decompiler, inspired by ILSpy and Mono.Cecil'
arch=('any')
url='https://bitbucket.org/mstrobel/procyon/wiki/Java%20Decompiler'
license=('Apache')
depends=('java-runtime')
source=("https://bitbucket.org/mstrobel/procyon/downloads/${pkgname}-${pkgver}.jar"
	"${pkgname}")
noextract=("${pkgname}-${pkgver}.jar")
md5sums=('2671dff5d19e569fae688c6c87712845'
         'c9f645ae4205b44a525c5f0d0575e320')

package() {
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
}
