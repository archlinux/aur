# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>

_pkgname="iwe"
pkgname="${_pkgname}-bin"
pkgver=0.0.35
pkgrel=1
pkgdesc="Text editor extension for markdown notes taking"
arch=('x86_64' 'aarch64')
url="https://github.com/iwe-org/${_pkgname}"
license=("Apache-2.0")
depends=('gcc-libs' 'glibc')
provides=('iwe' 'iwes')
conflicts=('iwe' 'iwes')

source=("https://github.com/iwe-org/${_pkgname}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")

sha256sums=('fbb2c92d3b25ff6ce1408cf57c718d5234cdb33ec030ee2235fe85da667f70dd')

package() {
  install -Dm 755 "${srcdir}/iwe" -t "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/iwes" -t "${pkgdir}/usr/bin/"
}

