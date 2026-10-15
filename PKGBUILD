# Maintainer: <mmoya at mmoya dot org>
#
pkgname=shipyard-bin
pkgver=0.3.22
pkgrel=1
pkgdesc='Run coding agents on your dev boxes: worktrees, terminals, orchestration, kits and automations, with a desktop app.'
arch=('x86_64')
url='https://github.com/cosscom/shipyard'
license=('MIT')
_filename="Berth-linux-${CARCH}-alpha.deb"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('80db679adf8c45ea997c39bc23999a96c0d6bedb038164d633fd7e3e4236d193')
options=('!debug')

package() {
    ar x "${_filename}"
    tar -vxz -C "${pkgdir}" -f data.tar.gz
}
