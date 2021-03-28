# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=i3-autodisplay-bin
_srcname=i3-autodisplay
pkgdesc="i3wm multiple monitors auto configuration"
pkgver=0.5
pkgrel=1
arch=('x86_64')
url="https://github.com/lpicanco/i3-autodisplay/"
license=('GPL')
source=("${_srcname}-${pkgver}::https://github.com/lpicanco/i3-autodisplay/releases/download/v${pkgver}/${_srcname}-${pkgver}-linux-amd64")
sha256sums=('2c9eeb50b41c5e872977ef7d77ded42e64f8f81100a4757d4151b929569aadc8')

package() {
    install -Dm755 "${srcdir}/${_srcname}-${pkgver}" "${pkgdir}/usr/bin/${_srcname}"
}

