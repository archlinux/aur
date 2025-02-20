# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname='imgcat-bin'
_pkgname='imgcat'
pkgver=1.2.0
pkgrel=3
pkgdesc='Tool to output images in the terminal'
url='https://github.com/trashhalo/imgcat'
arch=('x86_64' 'i686')
license=('MIT')

provides=('imgcat')
conflicts=('imgcat')
source_x86_64=(
  "${url}/releases/download/v${pkgver}/imgcat_${pkgver}_Linux_x86_64.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/imgcat_${pkgver}_Linux_i386.tar.gz"
)

sha256sums_x86_64=(
  'c116bc543ab0d08a1b594c79c929802f5e245f96a5d93abf41fd77d729596393'
)
sha256sums_i686=(
  '69e38197c34969cec0edcb7d05a4e041e46c2f1400dfa19ea4bb26826f4c6b91'
)

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${_pkgname}" "$pkgdir"/usr/bin/"${_pkgname}"
}
