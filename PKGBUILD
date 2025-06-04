# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname=vidmerger
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="Merge video and audio files via CLI."
arch=('x86_64')
url="https://github.com/tgotwig/vidmerger"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gcc-libs')
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-linux.tar.gz"
        "https://raw.githubusercontent.com/tgotwig/vidmerger/cb3526790dae9ebc72f52c5c16d1428846645e53/LICENSE")
sha256sums=('538641badacc0380a281d0cf31eec928b10835563aaae6ecb4311fa30a7a2991'
            'fb25a5d14edb9164a63a126aec696eceb654b4b0e8b382bcac378b6c44eb920c')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
