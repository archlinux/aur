# Contributor: craven@gmx.net 
# Maintainer: realitygaps AT yahoo DOT com
pkgname=xstream
pkgver=1.4.7
pkgrel=1
pkgdesc="Simple java library to serialize objects to XML and back again."
arch=('i686' 'x86_64')
url="http://xstream.codehaus.org/index.html"
license=('BSD')
depends=('java-environment')
source=(https://nexus.codehaus.org/content/repositories/releases/com/thoughtworks/${pkgname}/xstream-distribution/${pkgver}/${pkgname}-distribution-${pkgver}-bin.zip)
build() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	cd ${srcdir}
	cd ${pkgname}-${pkgver}/lib/

	install -m644 ../LICENSE.txt ${pkgdir}/usr/share/java/${pkgname} 
	install -m644 ../README.txt ${pkgdir}/usr/share/java/${pkgname} 

  for i in *.jar ; do
            install -m644 ${i} ${pkgdir}/usr/share/java/${pkgname} 
	done
	
}
md5sums=('ea6a77eb51390c6888f5ca3c3a42d87b')
