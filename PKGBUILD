# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-freon
pkgver=13
pkgrel=1
pkgdesc="Displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidia/Catalyst), voltage and fan RPM in a GNOME Shell top bar pop-down."
arch=('any')
url="https://github.com/UshakovVasilii/gnome-shell-extension-freon"
license=('GPL')
depends=('dconf' 'gnome-shell' 'lm_sensors')
makedepends=('gnome-common' 'intltool')
optdepends=(
  'udisks2: optional backend for storage temperature sensors.'
  'hddtemp: optional backend for S.M.A.R.T. temperature sensors.'
)
provides=('gnome-shell-extension-freon')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extensions-freon')
install="gschemas.install"
source=("${pkgname}::https://github.com/UshakovVasilii/gnome-shell-extension-freon/archive/EGO-13.tar.gz")
sha512sums=('ff1cb2b6294b85d955b25d74242f2905004be4b475e758cbe8e7d199a579fc113422b6d4c6d445c13508f23740078ccde59db99480026cc443b3db5beacb9c45')

package() {
  cd "${srcdir}/${pkgname}-EGO-13"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r freon@UshakovVasilii_Github.yahoo.com "${pkgdir}/usr/share/gnome-shell/extensions/"
}
