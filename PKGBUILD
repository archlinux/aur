# Maintainer: Max le Fou <buttbadger@gmail.com>

pkgname=maelstrom-mod-star-trek
pkgver=1.0.0
pkgrel=1
pkgdesc="Mod for the game Maelstrom based on Star Trek"
arch=('any')
url="http://www.libsdl.org/projects/Maelstrom/add-ons.html"
depends=('maelstrom')
optdepends=()
conflicts=('maelstrom-mod-star-wars' 'maelstrom-mod-1980' 'maelstrom-mod-extra' 'maelstrom-mod-army-of-darkness' 'maelstrom-mod-beavis-butthead' 'maelstrom-mod-stooges')

source=(http://www.libsdl.org/projects/Maelstrom/add-ons/Star_Trek.zip)
sha256sums=('1d3fb2da8d56d480e7ec4f1ab3d15b58027454ca566f127691bcef4a25c4fd54')

package() {
  install -Dm644 "${srcdir}/Star_Trek/%Maelstrom Sounds" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sounds"
  install -Dm644 "${srcdir}/Star_Trek/%Maelstrom Sprites" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sprites"
}
