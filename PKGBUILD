# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.7.0
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus' 'pciutils')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver-x86_64.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation-x86_64.tar.gz)

sha256sums=('dec7ac765f915f579a785d53b64422ac9859776c0ebc3a830125ca7c103c3d9d')

prepare() {
  cd "$srcdir/${_pkgbase}"
}

package() {
  cd "$srcdir/${_pkgbase}"
  cp -r ./* ${pkgdir}
}
