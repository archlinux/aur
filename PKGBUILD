# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='imgcat-bin'
_pkgname='imgcat'
pkgver=1.0.2
pkgrel=2
pkgdesc='Tool to output images in the terminal'
url='https://github.com/trashhalo/imgcat'
arch=('x86_64' 'i686')
license=('MIT')

conflicts=('imgcat-git')
source_x86_64=(
  "${url}/releases/download/v${pkgver}/imgcat_${pkgver}_Linux_x86_64.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/imgcat_${pkgver}_Linux_i386.tar.gz"
)

sha256sums_x86_64=(
  '6ef8069c995bee68b0ee1a23abb6f4d69e96980c66b12707d81feb9a974d4a80'
)
sha256sums_i686=(
  '4ac20c7db042b73bd22219b47794b8f4333ec22cec1d8547f6dc4dc7f76c2ba7'
)

package() {
  install -Dm755 "${_pkgname}" "$pkgdir"/usr/bin/"${_pkgname}"
}
