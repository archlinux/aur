# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=4.0.2
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://pgaskin.net/kepubify/"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        seriesmeta-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/seriesmeta-linux-64bit)
md5sums=('419d7d58d3a50ea2fc2d1073204c0c5a'
         '19e5638118f7dd287a0bb4f92dea94bf')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
  install -m755 "${srcdir}/seriesmeta-${pkgver}" "${pkgdir}"/usr/bin/seriesmeta
}
