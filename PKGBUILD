# Maintainer: Hollow Man <hollowman at hollowman dot ml>
# Contributor: Hollow Man <hollowman at hollowman dot ml>

pkgname=gnome-shell-extension-customize-ibus
_pkgname=Customize-IBus
pkgver=18
pkgrel=1
epoch=0
pkgdesc="Customize IBus for orientation, font, ascii mode auto-switch; theme and background picture follow GNOME Night Light Mode."
arch=('any')
url="https://extensions.gnome.org/extension/4112/customize-ibus/"
license=('GPLv3')
depends=()
source=("https://github.com/HollowMan6/Customize-IBus/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')
package() {
  _uuid='customize-ibus@hollowman.ml'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions"
  cd ${_pkgname}-${pkgver}
  make _build VERSION=${pkgver}
  mkdir -p $_install_dir
  mv _build ${_install_dir}/${_uuid}
}
