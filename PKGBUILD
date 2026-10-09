# Maintainer: <mmoya at mmoya dot org>
#
pkgname=shipyard-bin
pkgver=0.3.13
pkgrel=1
pkgdesc='Run coding agents on your dev boxes: worktrees, terminals, orchestration, kits and automations, with a desktop app.'
arch=('x86_64')
url='https://github.com/cosscom/shipyard'
license=('MIT')
_filename="Berth-linux-${CARCH}-alpha.deb"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('e266200ca547d25c8f658c6317f97bbe33b14f54ea18a0f0b28eb35e39de806b')
options=('!debug')

package() {
    ar x "${_filename}"
    tar -vxz -C "${pkgdir}" -f data.tar.gz
}
