# Maintainer: nny <warezurun@gmail.com>
pkgname=ttf-rocknroll-one
pkgver=0.1.1
pkgrel=1
pkgdesc='RocknRoll is an original pop-style font. The strokes of varying intensity add momentum and the rounded dots create a lively and dynamic feel.'
arch=('any')
url='https://github.com/fontworks-fonts/RocknRoll'
license=('OFL')
_commit="29a2aa8bb7ab10702dee769ee681a9baeeb52ec1"
source=("https://github.com/fontworks-fonts/RocknRoll/raw/${_commit}/fonts/ttf/RocknRollOne-Regular.ttf")
sha256sums=('dc0f5ff975851827f63f2c6bfed128ffbca14b6399a10fb5e1711215c0108526')

package() {
    install -Dm644 "${srcdir}/RocknRollOne-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/RocknRollOne-Regular.ttf"
}
