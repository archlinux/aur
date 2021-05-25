# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>

pkgname=gnome-shell-extension-cpufreq
_pkgname=cpufreq
pkgver=49.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq-git')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('05844f66a9b808a058ae6b51d67c9bea66e3500736a02fa25cd7e340ba57f14f66eea71918c05396cd5586c04012af2a8393aa24d63519b82555625ef915009b')

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
