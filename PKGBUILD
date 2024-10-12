# Maintainer: a <a@tuxpa.in>
pkgname="potatoe"
pkgver=0.0.12
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
  '99dce31dd3e0d1c09811a55326e72daf15eb8e202ce33b90ead7b35181844a8c'
  'b6e29b842da4dc9c2302ee53208a7fd0479117aa18ad2df8a96814de3d165d5c'
)

package() {
	install -Dm755 potatoe "${pkgdir}"/usr/bin/potatoe
  install -Dm755 quotes.txt "${pkgdir}"/var/lib/potatoe/quotes.txt
}
