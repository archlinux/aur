# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.7.5
pkgrel=1
pkgdesc="A flat, colorful, and modern theme based on Paper and Moka (legacy)."
arch=('any')
url="https://github.com/linuxmint/mint-l-icons"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later AND CC-BY-SA-4.0')
depends=(
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("${pkgname}_${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('a89eb7bf220231900330314b0ebe8df296966aef3b440d34f4687d08069c112a')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}/"
}
