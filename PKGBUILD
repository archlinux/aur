# Maintainer: Charalampos Kardaris <ckardaris at outlook dot com>

pkgname=ucollage
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal image viewer based on Überzug written in bash."
arch=('any')
url="https://github.com/ckardaris/ucollage"
license=('GPL3')
depends=('bash>=4.2.0' 'ueberzug' 'file')
optdepends=(
  'imagemagick: Image rotation'
  'ffmpeg: Thumbnail creation'
)
_commit="8be920ea6356eb4c77f1514e6c0876b647703351"
source=("https://raw.githubusercontent.com/ckardaris/ucollage/v${pkgver}/ucollage")
sha256sums=('b0889ed85b5d143384ca40f10344234c1c73b05022dd0a17e8e5c41d05200185')

package() {
    cd "$srcdir"
    install -Dm755 ucollage "$pkgdir/usr/bin/ucollage"
}
