# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: xarkes

pkgname=unluac
pkgver=2021_06_01
pkgrel=1
pkgdesc="a decompiler for Lua 5.1"
arch=('any')
url="http://sourceforge.net/projects/unluac/"
depends=('java-runtime')
license=('MIT')
source=("https://downloads.sourceforge.net/project/unluac/Unstable/unluac_${pkgver}.jar"
         unluac.sh)

package() {
  cd $srcdir
  install -Dm644 ${srcdir}/unluac_${pkgver}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm755 ${srcdir}/unluac.sh $pkgdir/usr/bin/unluac
}

md5sums=('0bdf07add22031bf8aecfaaa79f9cf7c'
         'f86eb01199590ec711691c2c0f5ac539')
