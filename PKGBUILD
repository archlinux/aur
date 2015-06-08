# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-h2-database
pkgver=1.1.117
_reldate=20120119162704
_pkgdate=201105142352
pkgrel=2
pkgdesc="Support for H2 databases in Eclipse"
arch=('any')
url="http://www.eclipse.org/orbit/"
license=('EPL')
depends=("eclipse")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/tools/orbit/downloads/drops/R${_reldate}/repository/plugins/org.h2_${pkgver}.v${_pkgdate}.jar")
_jar=$(basename $source)
noextract=($_jar)

package() {
install -d $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins || return 1
install -m644 $srcdir/$_jar \
	$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins || return 1
}

md5sums=('4c7fb64c54bc630bf83f9a87b70982fe')

