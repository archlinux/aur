# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.1.5
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus' 'pciutils')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation.tar.gz)

sha256sums=('9e3c54bb4089efccc57f1475cc9906edfb86d5ca19556394fa217dd203776913')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
