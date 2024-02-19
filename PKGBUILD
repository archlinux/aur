# Maintainer: Alireza S.N <alireza6677 at gmail dot com>
pkgname=nautilus-send-to-bluetooth
pkgver=2.0
pkgrel=3
pkgdesc="Adds 'Send to bluetooth device' to nautilus right-click menu"
arch=('x86_64')
url='https://github.com/alireza6677/nautilus-send-to-bluetooth'
license=('GPL-3.0-or-later')
depends=('python' 'nautilus>=44' 'blueman' 'python-nautilus' 'bluez-obex')
provides=("nautilus-send-to-bluetooth")
source=("https://raw.githubusercontent.com/TheWeirdDev/nautilus-send-to-bluetooth/master/SendToBluetooth.py")
noextract=('SendToBluetooth.py')
b2sums=(SKIP)

package() {
	cd $srcdir
	install -Dm644 SendToBluetooth.py -t $pkgdir/usr/share/nautilus-python/extensions
}

