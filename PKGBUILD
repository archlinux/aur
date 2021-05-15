# Maintainer: Charalampos Kardaris <ckardaris at outlook dot com>

pkgname=ucollage
pkgver=1.0.0
pkgrel=1
pkgdesc="An extensible command line image viewer inspired by vim"
arch=('any')
url="https://github.com/ckardaris/ucollage"
license=('GPL3')
depends=('bash>=4.2.0' 'ueberzug' 'file' 'bc' 'coreutils' 'sed' 'grep')
optdepends=(
  'imagemagick: Image rotation'
  'ffmpeg: Thumbnail creation'
  'xclip: Clipboard pasting'
)
source=("https://github.com/ckardaris/ucollage/releases/download/v${pkgver}/ucollage-${pkgver}.tar.gz")
sha256sums=('36f912097a65a15bf261f2a74aecee442fc7ff2d6cb0d74f4fd60b5356125c38')

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install
}
