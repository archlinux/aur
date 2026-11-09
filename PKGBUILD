# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=kepubify-bin
_pkgname=kepubify
pkgver=5.0.0
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('x86_64')
url="https://pgaskin.net/kepubify/"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/pgaskin/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-64bit)
sha256sums=('cb77fe364f780feea8de4586600f7160c7516586c21d9a80b1504c6630389069')
package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}
