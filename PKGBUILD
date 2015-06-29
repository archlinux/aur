# Mantainer: Francisco Demartino <demartino.francisco@gmail.com>
pkgname=brreep
pkgver=1
pkgrel=1
pkgdesc="Beep glide on poweron/poweroff"
arch=('any')
url=('http://127.1.2.7/nowhere')
depends=(beep)
license=('GPL')
source=('brreep.service')
md5sums=('e29f234043ef6779ad06526e878d5cf5')

package() {
	install -D $srcdir/brreep.service "$pkgdir/usr/lib/systemd/system/brreep.service"
}

