# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=serviio-twitch-plugin
pkgver=17
_commit=2238ba6
pkgrel=1
pkgdesc="Twitch.tv plugin for Serviio"
arch=('any')
url="http://forum.serviio.org/viewtopic.php?f=20&t=9216"
license=('LGPL3')
depends=('serviio')
source=("git+https://github.com/bogenpirat/serviio-plugins.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd serviio-plugins

  install -D -m 0644 twitch.groovy "${pkgdir}/usr/share/java/serviio/plugins/twitch.groovy"
}

# vim:set ts=2 sw=2 et:
