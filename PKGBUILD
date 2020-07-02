# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: lorenzo at frenzart dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-luculent
pkgver=2.0.0
pkgrel=4
pkgdesc="Luculent is a family of scalable (vector), monospaced, geometric sans-serif screen fonts designed for programmers"
arch=('any')
url="http://eastfarthing.com/luculent/"
license=('OFL')
source=(http://eastfarthing.com/luculent/luculent.tar.xz)
sha256sums=('e8dc4b9d3067bc799351315adb05b402e28f11b0aacda590ca21559c5d2c06a5')

package() {
  cd luculent
  for f in luculentbi.ttf luculentb.ttf luculenti.ttf luculent.ttf; do
    install -Dm644 "$f" "${pkgdir}/usr/share/fonts/TTF/${f}"
  done
}

