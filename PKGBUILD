# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com
# Maintainer: Allen Choong <allencch at hotmail dot com>

pkgname=httpcomponents-client
pkgver=4.5.9
pkgrel=1
pkgdesc="A HTTP/1.1 compliant HTTP agent implementation based on HttpCore"
arch=('any')
url="http://hc.apache.org/"
license=("Apache")
depends=('java-runtime')
conflicts=('')
source=(http://www.apache.org/dist/httpcomponents/httpclient/binary/${pkgname}-${pkgver}-bin.tar.gz)
md5sums=('fa1c1e55b78604758d419de016dc4453')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	chmod +r *.jar
	cp *.jar ${pkgdir}/usr/share/java/${pkgname}
}

