# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=unluac
pkgver=205_04_12
pkgrel=1
pkgdesc="a decompiler for Lua 5.1"
arch=('any')
url="http://sourceforge.net/projects/unluac/"
depends=('java-runtime')
license=('MIT')
source=("http://sourceforge.net/projects/unluac/files/latest" unluac.sh)

package() {
cd $srcdir
install -Dm644 ${srcdir}/latest $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
install -Dm755 ${srcdir}/unluac.sh $pkgdir/usr/bin/unluac
}
md5sums=('0d26eba888c13e4525ccc884c5c7306a'
         'f86eb01199590ec711691c2c0f5ac539')
