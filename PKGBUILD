pkgname='apk-preview'
pkgver=1.0
pkgrel=1
pkgdesc="A graphical user interface to see APK file details & icon"
arch=('x86_64')
url='https://github.com/alireza6677/apk-preview'
license=('GPL3')
depends=( 'python' 'python-gobject')
makedepends=('git')
provides=("apk-preview")
source=("${pkgname}::git+https://github.com/alireza6677/apk-preview.git")
md5sums=('SKIP')


prepare() {
    cd "${srcdir}/${pkgname}"

}
package() {
	cd "${srcdir}/${pkgname}"
        install -d ${pkgdir}/usr    
        install -d ${pkgdir}/usr/bin
	cp -a ./* ${pkgdir}/usr/bin/
}

