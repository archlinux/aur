# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>

_pkgname="iwe"
pkgname="${_pkgname}-bin"
pkgver=0.0.39
pkgrel=1
pkgdesc="Text editor extension for markdown notes taking"
arch=('x86_64' 'aarch64')
url="https://github.com/iwe-org/${_pkgname}"
license=("Apache-2.0")
depends=('gcc-libs' 'glibc')
provides=('iwe' 'iwes')
conflicts=('iwe' 'iwes')

source=("https://github.com/iwe-org/${_pkgname}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")

sha256sums=('ceae1bec9c6344f92fea851a289aa8d5cb82f17b9078ff31b6c8208b0de4df85')

package() {
  install -Dm 755 "${srcdir}/iwe" -t "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/iwes" -t "${pkgdir}/usr/bin/"
}

