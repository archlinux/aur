# Maintainer: Paul Stoetzer <n8hm at arrl dot net>
pkgname=foxtelem
pkgver=1.06r
pkgrel=1
pkgdesc='Telemetry decoder for AMSATs Fox-1 satellites'
arch=('i686' 'x86_64')
url="http://amsat.us/FoxTelem/"
license=('GPL')
depends=('jre8-openjdk')
makedepends=()
provides=('foxtelem')
conflicts=()
options=('!emptydirs')
source=("http://amsat.us/FoxTelem/linux/foxtelem_1.06r_linux.tar.gz"
        "https://www.amsat.org/wordpress/wp-content/uploads/2018/05/foxtelem.png"
        'foxtelem.desktop'
        'foxtelem')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

build() {
    cd "foxtelem_1.06r_linux"
        
}

package() {
    cd "foxtelem_1.06r_linux"
	 mkdir -p ${pkgdir}/opt/foxtelem/
	 cp -r * ${pkgdir}/opt/foxtelem/
	 mkdir -p ${pkgdir}/usr/bin/
	 mkdir -p ${pkgdir}/usr/share/applications/
	 mkdir -p ${pkgdir}/usr/share/pixmaps/
	 cp ${srcdir}/foxtelem ${pkgdir}/usr/bin/
	 cp ${srcdir}/foxtelem.desktop ${pkgdir}/usr/share/applications/
	 cp ${srcdir}/foxtelem.png ${pkgdir}/usr/share/pixmaps/
}
