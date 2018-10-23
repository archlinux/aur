# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=serviio-twitch-plugin
pkgver=17
_commit=edbb4dfe17b9c6ff23c240cd70156f6568ca7ed5
pkgrel=2
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
