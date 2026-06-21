# Maintainer: KAAAsS <admin@kaaass.net>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: xarkes
# Contributor: Neko_Rikka

pkgname=unluac-unstable
pkgver=2025_12_23
pkgrel=1
pkgdesc="(unstable) a decompiler for Lua 5.x"
arch=('any')
url="http://sourceforge.net/projects/unluac/"
depends=('java-runtime')
conflicts=('unluac')
license=('MIT')
source=(
    $pkgname-$pkgver.jar::"https://downloads.sourceforge.net/project/unluac/Unstable/unluac_$pkgver.jar"
    unluac.sh
)

package() {
  cd $srcdir
  install -Dm644 ${srcdir}/$pkgname-$pkgver.jar "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755 ${srcdir}/unluac.sh "$pkgdir/usr/bin/unluac"
}

md5sums=(
    d899ca3cd4cdf32005dfd638d7d447d3
    50706e65c528abf7ce3e272296c92ee1
)
