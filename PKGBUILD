# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname=vidmerger
pkgname="${_pkgname}-bin"
pkgver=0.3.1
pkgrel=1
pkgdesc="Merge video and audio files via CLI."
arch=('x86_64')
url="https://github.com/tgotwig/vidmerger"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gcc-libs')
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-linux.tar.gz"
        "https://raw.githubusercontent.com/tgotwig/vidmerger/main/LICENSE")
sha256sums=('4639451ab1d31fc509dc950df7f2d1a8f7e718ef6d2d0844f936deba1cf4b74b'
            'fb25a5d14edb9164a63a126aec696eceb654b4b0e8b382bcac378b6c44eb920c')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
