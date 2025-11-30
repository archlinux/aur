# Maintainer: Filth <filth [at] wagn [dot] me>

pkgname="itchio-dlagent"
pkgver=0.1
pkgrel=1
pkgdesc="makepkg download agent for free itch.io games."
arch=('any')
options=("!debug")
url="https://aur.archlinux.org/packages/itchio-dlagent"
license=('0BSD')
depends=('ruby' 'ruby-nokogiri' 'ruby-httpx')
source=("$pkgname.rb")
b2sums=('84d5b2dc6614738e8a1f95bf430a1626f9e5b4fbfab2f50b2a65c57cebc105e0884213b49c223150096a5ec81e5642a32b3007cad61850c0c8a44919e0db3ad5')

package() {
  install -Dm755 "$pkgname.rb" "$pkgdir/usr/bin/$pkgname"
}
