# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.35.1
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armv7h')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('2b7ea28c99121cb0325e6b089291c2c8a7bbd7f17ca6642b93e0e6879385b9ca')
sha256sums_aarch64=('f6b1d4ec9671a9adcb1d12b09d9b964c2f68dc943a38006db38c77c0fdbb61f6')
sha256sums_armv7h=('7a7e22cd8965afa3c3f3d468ef4238e5cdbbf0bf1e25b9046bbbeabd2e191543')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
