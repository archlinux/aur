# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=3.1.2
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://geek1011.github.io/kepubify"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/geek1011/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        seriesmeta-${pkgver}::https://github.com/geek1011/${_pkgname}/releases/download/v${pkgver}/seriesmeta-linux-64bit)
md5sums=('20a9db3eed4a3912bcebfa159bb62b48'
         '3ce4b01893272e4606d3ff4dc6f3a148')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
  install -m755 "${srcdir}/seriesmeta-${pkgver}" "${pkgdir}"/usr/bin/seriesmeta
}
