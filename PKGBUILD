# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=serviio-twitch-plugin
pkgver=17
pkgrel=1
pkgdesc="Twitch.tv plugin for Serviio"
arch=('any')
url="http://forum.serviio.org/viewtopic.php?f=20&t=9216"
license=('unknown')
depends=('serviio')
source=("twitch.groovy::http://forum.serviio.org/download/file.php?id=5696")
sha256sums=('0aa7956a98b03064116b3a974369d6cefe3da36e475ab9ed47d9ea26ad3acdf5')

package() {
  install -D -m 0644 twitch.groovy "${pkgdir}/usr/share/java/serviio/plugins/twitch.groovy"
}

# vim:set ts=2 sw=2 et:
