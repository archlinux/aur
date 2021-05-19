# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>

pkgname=gnome-shell-extension-cpufreq
_pkgname=cpufreq
pkgver=47.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq-git')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('214fd3d3b9e317d88f0a466f89317185643496fa25d0d7f14f6411add949517ac68e6f59979cb5ef18fc2ffac134df38f907f62bdd6edba5f84656fc6a6e214d')

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
