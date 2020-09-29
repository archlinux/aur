# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kondo-bin
pkgver=0.4
pkgrel=1
pkgdesc='Save disk space by cleaning unneeded files from software projects'
arch=('x86_64')
url="https://github.com/tbillington/kondo"
license=('MIT')
provides=('kondo')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kondo-x86_64-unknown-linux-gnu.tar.gz"
    'LICENSE::https://github.com/tbillington/kondo/raw/master/LICENSE')
sha256sums=('f16790ab4445890e0acef32dc256c44bf0b6abf46930fae6e3ff54b231346c42'
            '86d6e0473685c1e4e43f0bf291ad7a948035d314ea5986f738a53354f7c059e6')

package() {
  install -Dm755 ${srcdir}/kondo "${pkgdir}/usr/bin/kondo"
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
