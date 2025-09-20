# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.4.4
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3")
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=('9d25fba90f45119c6548c1e078b28fa06476c1c24a77b3b31629ae379ad6ff62')
sha256sums_aarch64=('4d054ba02efbdba98bd975ffa8076f202609ad68285ff8f7556d6f9c27be1f66')
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
