# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>

_pkgname="iwe"
pkgname="${_pkgname}-bin"
pkgver=0.0.26
pkgrel=1
pkgdesc="Text editor extension for markdown notes taking"
arch=('x86_64' 'aarch64')
url="https://github.com/iwe-org/${_pkgname}"
license=("Apache-2.0")
depends=('gcc-libs' 'glibc')
provides=('iwe' 'iwes')
conflicts=('iwe' 'iwes')

source=("https://github.com/iwe-org/${_pkgname}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")

sha256sums=('SKIP')

package() {
  install -Dm 755 "${srcdir}/iwe" -t "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/iwes" -t "${pkgdir}/usr/bin/"
}

