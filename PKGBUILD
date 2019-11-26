# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=2.4.0
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://geek1011.github.io/kepubify"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/geek1011/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        seriesmeta-${pkgver}::https://github.com/geek1011/${_pkgname}/releases/download/v${pkgver}/seriesmeta-linux-64bit)
md5sums=('a7964455fa7ec204edbd124f87fdef29'
         '15fc65885987b511c64fa6d6dd08a395')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
  install -m755 "${srcdir}/seriesmeta-${pkgver}" "${pkgdir}"/usr/bin/seriesmeta
}
