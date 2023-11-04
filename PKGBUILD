# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.1.2
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation.tar.gz)

sha256sums=('bcc82632186a4860f3946112fc84a276c7e7c4d65837b3c3a85aa9c87ae36b99')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
