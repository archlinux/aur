# Maintainer: a <a@tuxpa.in>
pkgname="potatoe"
pkgver=0.0.6
pkgrel=1
epoch=1
pkgdesc="Prints a potatoe with a DQ quote. Configurable!"
arch=("x86_64" "amd64")
url="https://github.com/elee1766/potatoe"
license=('GPL')
depends=(python)
source=(
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/potatoe"
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/quotes.txt"
)
sha256sums=(
  'edd1575d1ddc0eb589f8971d8f0a3df5ed6a46388af1f6bfe875360ee1269e24'
  '204e3ea720c724b0023f0ab39ea21c0a7973ae121731c0d01a21c736a6709bd1'
)

package() {
	install -Dm755 potatoe "${pkgdir}"/usr/bin/potatoe
  install -Dm755 quotes.txt "${pkgdir}"/var/lib/potatoe/quotes.txt
}
