# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.34.3
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('790467bf177eeede7cce565eca5dc8a835ec61cff5a1d675915ba522ba66f386')
sha256sums_aarch64=('b0472cc2c23fca3bffea13fb891b909f43f5f54a737b2e382bf882ec81c6685c')
sha256sums_armhf=('39593db1ea9d806110a280aca0eed6956fe0f9f25c198840cceb5e8122987dae')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
