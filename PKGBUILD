# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=4.0.3
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://pgaskin.net/kepubify/"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        seriesmeta-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/seriesmeta-linux-64bit)
md5sums=('e5b335d488434fe3def49c297249e54e'
         'fd70307cca12321991c21a048498e0ff')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
  install -m755 "${srcdir}/seriesmeta-${pkgver}" "${pkgdir}"/usr/bin/seriesmeta
}
