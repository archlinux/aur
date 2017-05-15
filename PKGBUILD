# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

pkgname=gnome-shell-extension-arch-update
pkgver=22
pkgrel=1
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('gnome-shell>=3.18')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RaphaelRochet/arch-update/archive/v${pkgver}.tar.gz")
sha512sums=('b18ff2dacd713f958eda2107de2d6159be301565a532efb6f398d4bd999e10823991aabb5f849df83a46ed6d20883ff37bc9ff706da64fb1078a89612951bb65')


package() {
  _uuid='arch-update@RaphaelRochet'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "arch-update-${pkgver}"
  cp -r * $_install_dir
}
