# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3")
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=('e5c2e996ea9d2c681f2ee09e34abb8e001d66f6714e04ce2cf88b89556fb7f3a')
sha256sums_aarch64=('62e9bda88f0fcc48e49f2ffd64ff05a2c8ddfe06b4306c9b41d812c8195e2f86')
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
