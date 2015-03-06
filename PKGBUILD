# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-yandex
pkgver=20150104
pkgrel=1
pkgdesc="Yandex Translate plugin for OmegaT"
arch=('any')
url="https://sourceforge.net/projects/yandextranslatepluginforomegat/"
license=('GPL2')
depends=('omegat')
options=('!strip')
source=(http://sourceforge.net/projects/yandextranslatepluginforomegat/files/OmegaT-plugins-YandexTranslate.jar)
sha256sums=('2f10ba58058c03a0990a98abb7e6900c825aba9d37804256ebc57c5302c624c5')

package() {
  cd "${srcdir}"

  install -Dm644 OmegaT-plugins-YandexTranslate.jar \
    "${pkgdir}"/usr/share/java/omegat/plugins/yandex/yandextranslate.jar
}
