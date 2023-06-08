# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.32.9
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('a61a69f2ce4801b5e77e3b8339d4ba75397ae8f0ff3a9769f0877ecd97ff0623')
sha256sums_aarch64=('c9b1a710a0e47b4215b72fcdb6adf199068d39d98ff4bca34bcf66e572f5da11')
sha256sums_armhf=('e63e0b76a45f70a128d4710dfc48461c6e53bb99210cfb56ff8cefb83a34be28')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
