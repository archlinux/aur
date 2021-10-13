# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=i3-autodisplay-bin
_srcname=i3-autodisplay
pkgdesc="i3wm multiple monitors auto configuration"
pkgver=0.6
pkgrel=1
arch=('x86_64')
url="https://github.com/lpicanco/i3-autodisplay/"
license=('GPL')
source=("${_srcname}-${pkgver}::https://github.com/lpicanco/i3-autodisplay/releases/download/v${pkgver}/${_srcname}-${pkgver}-linux-amd64")
sha256sums=('1fb3d494a093d81e177c5a9c93dcd5362f0764e45b4af0c7a43d91d0cee982d9')

package() {
    install -Dm755 "${srcdir}/${_srcname}-${pkgver}" "${pkgdir}/usr/bin/${_srcname}"
}

