# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-bin
_pkgbase=powerstation
pkgver=v0.4.1
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus' 'pciutils')
provides=('powerstation')
conflicts=('powerstation-git')
source=(powerstation-$pkgver.tar.gz::https://github.com/ShadowBlip/PowerStation/releases/download/$pkgver/powerstation.tar.gz)

sha256sums=('d7fd6634e892deb580a59f013db988a7b98b86578940375ad020dafb82a6f602')

prepare() {
  cd "$srcdir/${_pkgbase}"
}

package() {
  cd "$srcdir/${_pkgbase}"
  cp -r ./* ${pkgdir}
}
