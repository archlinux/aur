pkgname=proverbilo-bin
_pkgname=proverbilo
pkgver=0.1.9
pkgrel=1
pkgdesc='Programo por montri hazardajn proverbojn en Esperanto'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/proverbilo'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6b6dc17bc6f8bb7e4fed3ed3e86eb3582f18d50da3850511c27d895ca8c9c21d')
sha256sums_aarch64=('7a3730e6d8319c64e82da71f14139545dbb6a49089f22eea2560c15d6775395c')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
