# Maintainer: <mmoya at mmoya dot org>
#
pkgname=shipyard-bin
pkgver=0.3.27
pkgrel=1
pkgdesc='Run coding agents on your dev boxes: worktrees, terminals, orchestration, kits and automations, with a desktop app.'
arch=('x86_64')
url='https://github.com/cosscom/shipyard'
license=('MIT')
_filename="Berth-linux-${CARCH}-alpha.deb"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('d436f8deb3e3768cac08e08483b1e616a0e6f9517bd64fc74a88a6c354afe272')
options=('!debug')

package() {
    ar x "${_filename}"
    tar -vxz -C "${pkgdir}" -f data.tar.gz
}
