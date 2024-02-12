# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname=vidmerger
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="Merge video and audio files via CLI."
arch=('x86_64')
url="https://github.com/tgotwig/vidmerger"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gcc-libs')
source=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-linux.tar.gz"
        "https://raw.githubusercontent.com/tgotwig/vidmerger/main/LICENSE")
sha256sums=('8c061848f9879fc06771dbd9b4311452e113efa80d57cf157402934602082487'
            'fb25a5d14edb9164a63a126aec696eceb654b4b0e8b382bcac378b6c44eb920c')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
