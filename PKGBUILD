# Maintainer: Czipperz <czipperz@gmail.com>

pkgname=xfluxd-args
pkgver=1.0
pkgrel=7
pkgdesc="Daemon for xflux that allows for any arguments to be passed in"
url=https://justgetflux.com/
arch=('any')
license=(GPL3)
depends=(xflux)
source=(xfluxd-args.conf xfluxd-args.service)
install=xfluxd-args.install
conflicts=('xfluxd' 'auto-xflux')
md5sums=('edf22f4e3e1bfba14c12967536a9053d'
	 'c645a1216c2ebc45cedc1e0347b55ce4')
conflicts=('xfluxd')

package() {
    install -Dm664 ${srcdir}/xfluxd-args.conf ${pkgdir}/etc/xfluxd-args.conf
    install -Dm664 ${srcdir}/xfluxd-args.service ${pkgdir}/usr/lib/systemd/user/xfluxd-args.service
}
