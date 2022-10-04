# Maintainer: Max le Fou <buttbadger@gmail.com>

pkgname=maelstrom-mod-1980
pkgver=1.0.0
pkgrel=1
pkgdesc="Mod for the game Maelstrom mimicking the 80s style"
arch=('any')
url="http://www.libsdl.org/projects/Maelstrom/add-ons.html"
depends=('maelstrom')
optdepends=()
conflicts=('maelstrom-mod-star-trek' 'maelstrom-mod-star-wars' 'maelstrom-mod-extra' 'maelstrom-mod-army-of-darkness' 'maelstrom-mod-beavis-butthead' 'maelstrom-mod-stooges')

source=(http://www.libsdl.org/projects/Maelstrom/add-ons/Maelstrom_1980.zip)
sha256sums=('fb6128a48cdf855709e6fa4a219be53e413b0d40d94f5ae509091af2360f8816')

package() {
  install -Dm644 "${srcdir}/Maelstrom_1980/%Maelstrom Sounds" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sounds"
  install -Dm644 "${srcdir}/Maelstrom_1980/%Maelstrom Sprites" "${pkgdir}/usr/share/Maelstrom/%Maelstrom Sprites"
}
