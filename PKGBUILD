# Maintainer: murkl <murkl@users.noreply.github.com>
# Stamped by tools/aur.sh at a release. The placeholders are filled there.

pkgname=plymouth-theme-arch-os
pkgver=1.0.0
pkgrel=1
pkgdesc='Boot splash of Arch OS for Plymouth'
arch=('any')
url='https://github.com/murkl/plymouth-theme-arch-os'
license=('GPL-2.0-or-later')
depends=('plymouth' 'adwaita-fonts')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4f9a0846a0ae7e75f4488a55fb65443fd34cee56e430d66d00a3f86d3332c864')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 src/* -t "${pkgdir}/usr/share/plymouth/themes/arch-os"
}
