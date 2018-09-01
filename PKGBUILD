# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=java-commons-lang3
pkgver=3.8
pkgrel=1
pkgdesc='Provides highly reusable static utility methods, chiefly concerned with adding value to the java.lang classes.'
arch=('any')
url='http://commons.apache.org/lang/'
license=('apache')
depends=('java-runtime' 'bash')
source=("http://www.apache.org/dist/commons/lang/binaries/commons-lang3-${pkgver}-bin.tar.gz")
sha1sums=('cdf6ecbc93355be416875aba51010b8bc51d9352')
sha256sums=('70c659a90805cec1f546ebe812e571d00f8ca5b3fcd968c7149df6f6b740193e')

package() {
	cd "$srcdir/commons-lang3-${pkgver}"

	msg2 "Install Java libraries in /usr/share/java/commons-lang3..."
	install -d "$pkgdir"/usr/share/java/commons-lang3
	install -m 644 commons-lang3-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang3/commons-lang3-${pkgver}.jar
	ln -s commons-lang3-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang3/commons-lang3.jar
}

# vim:set ts=2 sw=2 ft=sh et:
