# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=i3-autodisplay-bin
_srcname=i3-autodisplay
pkgdesc="i3wm multiple monitors auto configuration"
pkgver=0.4
pkgrel=1
arch=('x86_64')
url="https://github.com/lpicanco/i3-autodisplay/"
license=('GPL')
source=("${_srcname}-${pkgver}::https://github.com/lpicanco/i3-autodisplay/releases/download/v${pkgver}/${_srcname}-${pkgver}-linux-amd64")
sha256sums=('2e1218ae53a82cd75294f4ee63d5edd0eb475c5172cbb9b7055dbe7ad9b27739')

package() {
    install -Dm755 "${srcdir}/${_srcname}-${pkgver}" "${pkgdir}/usr/bin/${_srcname}"
}

