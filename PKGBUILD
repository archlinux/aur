# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3")
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=('b5b101e5d45f687861166251d5576a0f53d2679c6c4160384083e552953ce1a9')
sha256sums_aarch64=('72944db3efc45b88e1bae0308f8050a3c5ae3f1aca23daa09b824fcd1142976d')
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
