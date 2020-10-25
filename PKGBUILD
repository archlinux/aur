# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='imgcat-bin'
_pkgname='imgcat'
pkgver=1.0.2
pkgrel=1
pkgdesc='Tool to output images in the terminal'
url='https://github.com/trashhalo/imgcat'
arch=('x86_64')
license=('MIT')

conflicts=('imgcat-git')
source=(
  "${url}/releases/download/v${pkgver}/imgcat_${pkgver}_Linux_x86_64.tar.gz"
)

sha256sums=(
  '6ef8069c995bee68b0ee1a23abb6f4d69e96980c66b12707d81feb9a974d4a80'
)

package() {
  install -Dm755 "${_pkgname}" "$pkgdir"/usr/bin/"${_pkgname}"
}
