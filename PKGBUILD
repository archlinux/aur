# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>

pkgname=gnome-shell-extension-cpufreq
_pkgname=cpufreq
pkgver=42.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq-git')
depends=('gnome-shell')
source=("https://github.com/konkor/cpufreq/archive/v${pkgver}.tar.gz")
sha256sums=('4f449ff1aad09299c8eecae06cfa51db4e55e2c33a3a2e73e09f75e3db915859')

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
