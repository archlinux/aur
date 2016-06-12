# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=serviio-twitch-plugin
pkgver=16
pkgrel=1
pkgdesc="Twitch.tv plugin for Serviio"
arch=('any')
url="http://forum.serviio.org/viewtopic.php?f=20&t=9216"
license=('unknown')
depends=('serviio')
source=("twitch.groovy::http://forum.serviio.org/download/file.php?id=5552")
sha256sums=('7c111204240259fc849d84003ee0bd88cf14d56e99b82ed6ee8b69e8136d549a')

package() {
  install -D -m 644 twitch.groovy "${pkgdir}/usr/share/java/serviio/plugins/twitch.groovy"
}

# vim:set ts=2 sw=2 et:
