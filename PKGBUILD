# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=3.1.4
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://pgaskin.net/kepubify/"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        seriesmeta-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/seriesmeta-linux-64bit)
md5sums=('39cde0884708207d331688036d3633ca'
         'f6b34c8e3cd7ef61d54a5dd0b4e35d4d')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
  install -m755 "${srcdir}/seriesmeta-${pkgver}" "${pkgdir}"/usr/bin/seriesmeta
}
