# Maintainer: <mmoya at mmoya dot org>
#
pkgname=shipyard-bin
pkgver=0.3.16
pkgrel=1
pkgdesc='Run coding agents on your dev boxes: worktrees, terminals, orchestration, kits and automations, with a desktop app.'
arch=('x86_64')
url='https://github.com/cosscom/shipyard'
license=('MIT')
_filename="Berth-linux-${CARCH}-alpha.deb"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('93bee791b1d0ac8afddb5559907f1e2104d2e53224e34057a62839f14030ecc3')
options=('!debug')

package() {
    ar x "${_filename}"
    tar -vxz -C "${pkgdir}" -f data.tar.gz
}
