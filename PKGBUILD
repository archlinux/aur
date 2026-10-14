# Maintainer: <mmoya at mmoya dot org>
#
pkgname=shipyard-bin
pkgver=0.3.20
pkgrel=1
pkgdesc='Run coding agents on your dev boxes: worktrees, terminals, orchestration, kits and automations, with a desktop app.'
arch=('x86_64')
url='https://github.com/cosscom/shipyard'
license=('MIT')
_filename="Berth-linux-${CARCH}-alpha.deb"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('149641a530fbc19257c67ab5a0f3a6da2a784de2c0fe026cd87dc4d65d3ba0f7')
options=('!debug')

package() {
    ar x "${_filename}"
    tar -vxz -C "${pkgdir}" -f data.tar.gz
}
