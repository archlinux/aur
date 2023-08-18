# Maintainer: szdytom <szdytom@qq.com>
pkgname=xremap-gnome-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (Gnome Wayland Version)'
pkgver=0.8.6
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'

arch=('x86_64' 'aarch64')
source=("LICENSE")
sha256sums=("60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343")

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-gnome.zip")
sha256sums_x86_64=('77b1061cbe9346074c36080f2f8abd99a3ee74cbf1c9ec3b489541e869e5c939')

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-gnome.zip")
sha256sums_aarch64=('3417427616a87e9794d7f0ec76ba4556c488239fafbc7fb081dfd1f7f3488d0e')

package() {
	cd "$srcdir/"
	install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/xremap-gnome-bin/LICENSE"
}
