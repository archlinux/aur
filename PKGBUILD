# Maintainer: a <a@tuxpa.in>
pkgname="potatoe"
pkgver=0.0.8
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
  'c8b4d3433b1e65044768f1bd0e4fb76eeeff860df56fa5acbf7c27db641744d3'
  '668f3831d04f2d51f93fd9839f2e06451aa3f2890025f622c1949fe03334ed7f'
)

package() {
	install -Dm755 potatoe "${pkgdir}"/usr/bin/potatoe
  install -Dm755 quotes.txt "${pkgdir}"/var/lib/potatoe/quotes.txt
}
