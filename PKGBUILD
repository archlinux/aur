# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.1.1
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation.tar.gz)

sha256sums=('c1d8fec7dbca1cbdf49a48ae698d0ebd7e4510486e98791df1b8a91d03dc359d')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	cd "$srcdir/${_pkgbase}"
	cp -r ./* ${pkgdir}
}
