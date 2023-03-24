# Maintainer: T41US <t41us at protonmail dot com>
# Contributer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kondo-bin
pkgver=0.6
pkgrel=1
pkgdesc='Save disk space by cleaning unneeded files from software projects'
arch=('x86_64')
url="https://github.com/tbillington/kondo"
license=('MIT')
provides=('kondo')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kondo-x86_64-unknown-linux-gnu.tar.gz"
    'LICENSE::https://github.com/tbillington/kondo/raw/master/LICENSE')
sha256sums=('dc54065a38bff9653d6b6792f8fb47180bf4a0c30d37fda721e233d2bec0f614'
            '86d6e0473685c1e4e43f0bf291ad7a948035d314ea5986f738a53354f7c059e6')

package() {
  install -Dm755 ${srcdir}/kondo "${pkgdir}/usr/bin/kondo"
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
