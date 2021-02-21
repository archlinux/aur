# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>

pkgname=gnome-shell-extension-cpufreq
_pkgname=cpufreq
pkgver=45.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
conflicts=('gnome-shell-extension-cpufreq-git')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('843764b47496f1ee17934479393f4e3ad2a65c5f584ba11473b3acf65aaf31c719961982102b323428cea298fbf435a7e2d725848eec2a73450c145ddac371bf')

package() {
  _extid='cpufreq@konkor'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
