# Maintainer: a <a@tuxpa.in>
pkgname="potatoe"
pkgver=0.0.14
pkgrel=1
epoch=1
pkgdesc="Prints a potatoe with a DQ quote. Configurable!"
arch=("x86_64" "amd64")
url="https://github.com/elee1766/potatoe"
license=('GPL')
depends=(luajit)
source=(
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/potatoe"
  "https://raw.githubusercontent.com/elee1766/potatoe/v${pkgver}/quotes.txt"
)
sha256sums=(
  '4ca53ce41d51e3e3c5bd6159f616aae9fd78b7b4872091dd9779a55c9a6c95ff'
  'b6e29b842da4dc9c2302ee53208a7fd0479117aa18ad2df8a96814de3d165d5c'
)

package() {
	install -Dm755 potatoe "${pkgdir}"/usr/bin/potatoe
  install -Dm755 quotes.txt "${pkgdir}"/var/lib/potatoe/quotes.txt
}
