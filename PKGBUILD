# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=1.3.5
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://codeship.com"
license=('MIT')
source_x86_64=(https://github.com/geek1011/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit)
md5sums_x86_64=('791bb2f3867dc0c2c18298a9dd8cb3fb')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-linux-64bit" "${pkgdir}"/usr/bin/${_pkgname}
}
