# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>

pkgname=gnome-shell-extension-cpufreq
_pkgname=cpufreq
pkgver=46.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq-git')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('8a0000cde1997591205593b88a56dd87cf9d6ca4246113aed6c0087750e211c2b80a867fc59056f85830cb6663f20a5eb1339af31ea8e1d780645ef3456dc7cd')

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
