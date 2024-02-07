pkgname=nautilus-send-to-bluetooth
pkgver=2.0
pkgrel=2
pkgdesc="Adds 'Send to bluetooth device' to nautilus right-click menu"
arch=('any')
url='https://github.com/alireza6677/nautilus-send-to-bluetooth'
license=('GPL3')
depends=( 'python' 'nautilus>=44' 'blueman' 'python-nautilus' 'bluez-obex')
provides=("nautilus-send-to-bluetooth")

package() {
	cd "${srcdir}/" 
            
        install -d ${pkgdir}/usr/share/nautilus-python/extensions/

        cp -a ../SendToBluetooth.py ${pkgdir}/usr/share/nautilus-python/extensions/SendToBluetooth.py
}

