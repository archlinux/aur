# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

pkgname=gnome-shell-extension-arch-update
pkgver=26
pkgrel=1
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('fakeroot' 'gnome-shell>=3.18')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RaphaelRochet/arch-update/archive/v${pkgver}.tar.gz")
sha512sums=('e107194732a313e1b103928dd31778c882488b4c0fcee10c5105731cc84ff0a3ef46af61eca7e04b60ad59289a3e08e0dacae174aff277ce5ade50e96a146364')


package() {
  _uuid='arch-update@RaphaelRochet'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "arch-update-${pkgver}"
  cp -r * $_install_dir
}
