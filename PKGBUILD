# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3")
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=("4d212ba61971e16995b193cb8417f75af1cfa5ad24eb6fc9989826619d0f3d77")
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")
sha256sums_aarch64=("433f6f0dd4e353401a31819ef4f1df9dc950855189ef30b1fc5fdd3a59054edf")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
