# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=java-commons-lang
pkgver=2.6
pkgrel=3
pkgdesc='Provides highly reusable static utility methods, chiefly concerned with adding value to the java.lang classes.'
arch=(any)
url='http://commons.apache.org/lang/'
license=(apache)
depends=('java-runtime' 'bash')
source=("http://www.apache.org/dist/commons/lang/binaries/commons-lang-${pkgver}-bin.tar.gz")
md5sums=('444075803459bffebfb5e28877861d23')
sha256sums=('ff6a244bb71a9a1c859e81cb744d0ce698c20e04f13a7ef7dbffb99c8122752c')

package() {
	cd "$srcdir/commons-lang-${pkgver}"

	msg2 "Install Java libraries in /usr/share/java/commons-lang..."
	install -d "$pkgdir"/usr/share/java/commons-lang
	install -m 644 commons-lang-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang/commons-lang-${pkgver}.jar
	ln -s commons-lang-${pkgver}.jar "$pkgdir"/usr/share/java/commons-lang/commons-lang.jar
}
