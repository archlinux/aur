# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

pkgname=gnome-shell-extension-arch-update
pkgver=25
pkgrel=1
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('fakeroot' 'gnome-shell>=3.18')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RaphaelRochet/arch-update/archive/v${pkgver}.tar.gz")
sha512sums=('39d91c10e8b5e56e626709cd8408c135d3ffb12f399bf003138355cb6192ae35398926738d0699642bf6f8f46aa8f6018c7bc51f581b414aaf94e66f00b5ad37')


package() {
  _uuid='arch-update@RaphaelRochet'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "arch-update-${pkgver}"
  cp -r * $_install_dir
}
