# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=serviio-twitch-plugin
pkgver=15
pkgrel=1
pkgdesc="Twitch.tv plugin for Serviio"
arch=('any')
url="http://forum.serviio.org/viewtopic.php?f=20&t=9216"
license=('unknown')
depends=('serviio')
source=("twitch.groovy::http://forum.serviio.org/download/file.php?id=5070")
sha256sums=('0f63122e58dabc7fd510471f1615909a4b4404b3e84c931da582de870f1b0904')

package() {
  install -D -m 644 twitch.groovy "$pkgdir/usr/share/java/serviio/plugins/twitch.groovy"
}

# vim:set ts=2 sw=2 et:
