# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.4.5
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3")
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=('72d1e0888f34772bf28fcf4d87c914eb0e76549a704d1eeed1a2965586433c86')
sha256sums_aarch64=('d499e6eaf7d9365f920d727156a5492b45c822e071c0d48a113e5ea7837bd8d7')
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
