# Maintainer: nny <warezurun@gmail.com>
pkgname=ttf-delagothic
pkgver=0.1.0
pkgrel=1
pkgdesc='fat sans-serif font'
arch=('any')
url='https://github.com/syakuzen/DelaGothic'
license=('OFL')
_commit="da8b03e57a8977132b3d0358c48c8463374c74ab"
source=("https://github.com/syakuzen/DelaGothic/raw/${_commit}/fonts/ttf/DelaGothicOne-Regular.ttf")
sha256sums=('f73c81ed56ca9d07b796228f7f0f7e8f0117b64dcb54da7246f1001ace5c6d19')

package() {
    install -Dm644 "DelaGothicOne-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/DelaGothicOne-Regular.ttf"
}
