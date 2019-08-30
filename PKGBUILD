# Contributor: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=java-commons-lang
pkgver=3.9
pkgrel=1
pkgdesc='Provides highly reusable static utility methods, chiefly concerned with adding value to the java.lang classes.'
arch=('any')
url='http://commons.apache.org/lang/'
license=('apache')
depends=('java-runtime' 'bash')
source=("http://www.apache.org/dist/commons/lang/binaries/commons-lang3-${pkgver}-bin.tar.gz")
sha256sums=('71ae27bb43ddd6c5a365e351eb9a2e5d04c1781e2f06447b95eb6e162d0c1850')

package() {
	cd "$srcdir/commons-lang3-${pkgver}"

	msg2 "Install Java libraries in /usr/share/java/commons-lang..."
	install -d "$pkgdir"/usr/share/java/commons-lang
	install -m 644 commons-lang3-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang/commons-lang-${pkgver}.jar
	ln -s commons-lang-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang/commons-lang.jar
}
