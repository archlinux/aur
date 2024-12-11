# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.4.0
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus' 'pciutils')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation.tar.gz)

sha256sums=('2db6b69e3f9ea331d1fd79f762a1090d220c86d1e099135d5dd6d1f9e2da6670')

prepare() {
  cd "$srcdir/${_pkgbase}"
}

package() {
  cd "$srcdir/${_pkgbase}"
  cp -r ./* ${pkgdir}
}
