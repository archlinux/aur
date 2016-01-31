# Maintainer: Michael Wendland <dev@michiwend.com>

pkgname=gnome-shell-extension-arch-update
pkgver=9
pkgrel=1
pkgdesc="Update indicator for ArchLinux and Gnome-Shell"
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('unknown')
depends=('gnome-shell>=3.18')
provides=('gnome-shell-extension-arch-update')
conflicts=('gnome-shell-extension-arch-update')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RaphaelRochet/arch-update/archive/v${pkgver}.tar.gz")
sha256sums=('d51853c5bfdc3cae6ea8155b579516593dbce1ba801dd49e4690b0d3f9c0c21d')


package() {
  local _uuid='arch-update@RaphaelRochet'
  local _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "arch-update-${pkgver}"
  cp -R * $_install_dir
}

# vim: ts=2 sw=2 et:
