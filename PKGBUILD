pkgname='nautilus-send-to-bluetooth'
pkgver=1.0
pkgrel=1
pkgdesc="Adds 'Send to bluetooth device' to nautilus right-click menu"
arch=('any')
url='https://github.com/alireza6677/'
license=('GPL3')
depends=( 'python' 'nautilus' 'gnome-bluetooth')
provides=("nautilus-send-to-bluetooth")
#source=("${pkgname}::git+https://github.com/alireza6677/apk-preview.git")
#md5sums=('SKIP')


package() {
	cd "${srcdir}/" 
        pwd        
        install -d ${pkgdir}/usr/share/nautilus-python/extensions/

        cp -a ../SendToBluetooth.py  ${pkgdir}/usr/share/nautilus-python/extensions/
}

