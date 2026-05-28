pkgname=sehx-bin
_pkgname=sehx
pkgver=0.1.3
pkgrel=1
pkgdesc='SEnsible HeXadecimal, the ASCII-synergetic little-endian hexadecimal format'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/sehx-rs'
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d2b066700909dfc2ba28688b9a48ddbb4c3263dc0160892055800240437ef433')
sha256sums_aarch64=('b0c6e8857751e73d415e693015db19cb21e76479f38fe09b133d2c6b2ab184b9')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
