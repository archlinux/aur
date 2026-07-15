# Maintainer: Matthew Orlando <maorlando@gmail.com>

pkgname=ttf-cogslab-nerd
pkgver=2.7
pkgrel=1
pkgdesc="Cogwheel's customized Iosevka Slab font"
arch=(any)
url='https://codeberg.org/cogwheel/cogslab'
license=('OFL-1.1')
groups=('nerd-fonts')

_urlbase="${url}/releases/download/v${pkgver}"

source=(
  "${_urlbase}/Cogslab-${pkgver}.zip"
  "${_urlbase}/Cogslab-${pkgver}.zip.asc"
)
sha256sums=('130e7b94e0d8b670ea6d9fab721670f43a4a41f4326ed0b8ada708db6239b358'
            'SKIP')

validpgpkeys=("D4D61C0CA9FFCD6426B08F7C111B8156BAA8DA4C")

package() {
  install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
