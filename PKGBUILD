# Maintainer: Sumit Sahrawat <archlinux at sums dot rs>

pkgname=anime4k
pkgver=4.0.1
pkgrel=3
_tag="v${pkgver}"
_zip="Anime4K_v${pkgver:0:-2}.zip"
pkgdesc='A High-Quality Real Time Upscaler for Anime Video'
arch=('any')
url='https://github.com/bloc97/Anime4K#anime4k'
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=''
changelog=''
options=()
source=(
    "${_zip}::https://github.com/bloc97/Anime4K/releases/download/${_tag}/${_zip}"
    "LICENSE::https://raw.githubusercontent.com/bloc97/Anime4K/${_tag}/LICENSE"
)
noextract=()
validpgpkeys=()
sha256sums=(
    '139cd282086457c5adc79caf7b75b8b825091d71c9b54958c18745fea62d7ed7'
    'SKIP'
)

package() {
    install -Dm644 -t "${pkgdir}"/usr/share/anime4k "${srcdir}"/*.glsl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
