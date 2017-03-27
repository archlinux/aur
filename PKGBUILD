# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=chromecast-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="700 Google Chromecast background images"
url="http://chromecastbg.alexmeub.com/"
arch=('any')
license=('custom')
source=('https://dl.dropboxusercontent.com/u/535060/chromecast1200.zip')

package() {
  install -d -m755 "${pkgdir}"/usr/share/wallpapers/
  mv "${srcdir}"/chromecast1200 "${pkgdir}"/usr/share/wallpapers/
}

# vim:set ts=2 sw=2 et:
sha256sums=('1ef311714bb97004544ad9165a8498526f34f588bda591dd9ac7ff7d52a1a807')
