# Maintainer: Network_Jack <Network_Jack@null.net>
# Contributor: Marcs <aur (at) mg.odd.red>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=firefox-extension-greasemonkey
_file=4833089
pkgver=4.14
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
makedepends=('jq')
depends=('firefox>=52.0')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/greasemonkey-${pkgver}.xpi")
sha256sums=('87aa409675ad622588f17102b75c19405b9d628183e827881d72060d25e4ed5a')

package() {
  cd ${srcdir}
  install -Dpm644 "greasemonkey-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/greasemonkey-${pkgver}.xpi"
}
