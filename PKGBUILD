# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.6.7
pkgrel=1
pkgdesc='A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza'
arch=('any')
url="https://github.com/linuxmint/mint-x-icons"
license=('GPL3')
depends=(
    'gdk-pixbuf2'
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
options=(!strip)
source=("http://packages.linuxmint.com/pool/main/m/$pkgname/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2b348a3d26e38a0f1d845022766fd915feee0f32cf849ef8ec0f34e06328dd8c')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
