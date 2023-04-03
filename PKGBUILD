# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-orthodox-herbertarian
pkgver=1.00
pkgrel=1
pkgdesc="Typeface used on Frank Herbert books in the 70s and 80s"
arch=('any')
# http://www.kullwahad.com/
url="https://archive.org/details/orthodox-herbertarian"
license=("Public Domain")
depends=()
makedepends=()

source=(
  'https://archive.org/download/orthodox-herbertarian/OrthodoxHerbertarian.ttf'
)
sha256sums=(
  '4bb75bd65b9c23e69fb7ce6987c9524d2ebaeb2b1717f16d0c23da3e7f19efea'
)

package() {
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "OrthodoxHerbertarian.ttf"
}
