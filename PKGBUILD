# Maintainer: Max le Fou <buttbadger@gmail.com>

pkgname=maelstrom-mod-star-wars
pkgver=1.0.0
pkgrel=1
pkgdesc="Mod for the game Maelstrom based on Star Wars"
arch=('any')
url="http://www.libsdl.org/projects/Maelstrom/add-ons.html"
depends=('maelstrom')
optdepends=()
conflicts=('maelstrom-mod-star-trek' 'maelstrom-mod-1980' 'maelstrom-mod-extra' 'maelstrom-mod-army-of-darkness' 'maelstrom-mod-beavis-butthead' 'maelstrom-mod-stooges')

source=(http://www.libsdl.org/projects/Maelstrom/add-ons/Star_Wars.zip)
sha256sums=('3feb8e907a43ca5908f4220ba15e01989ea08cda8200424e2a3f38b76d52d1fd')

package() {
  install -Dm644 "${srcdir}/Star_Wars/%Maelstrom Sounds" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sounds"
  install -Dm644 "${srcdir}/Star_Wars/%Maelstrom Sprites" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sprites"
}
