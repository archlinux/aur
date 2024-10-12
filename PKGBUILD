# Maintainer: a <a@tuxpa.in>
pkgname="potatoe"
pkgver=0.0.13
pkgrel=1
epoch=1
pkgdesc="Prints a potatoe with a DQ quote. Configurable!"
arch=("x86_64" "amd64")
url="https://github.com/elee1766/potatoe"
license=('GPL')
depends=(lua)
source=(
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/potatoe"
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/quotes.txt"
)
sha256sums=(
  '4db5b0ead1ed86178f5db3c3cafdc4745bcf57bf3a4eb27b2616dad67ae3a9a3'
  'b6e29b842da4dc9c2302ee53208a7fd0479117aa18ad2df8a96814de3d165d5c'
)

package() {
	install -Dm755 potatoe "${pkgdir}"/usr/bin/potatoe
  install -Dm755 quotes.txt "${pkgdir}"/var/lib/potatoe/quotes.txt
}
