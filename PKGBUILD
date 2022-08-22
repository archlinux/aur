# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('078595b5ec7351296c4a40032ac7afdaf64c8dbb2250e3d20d58a89f4e49529c')
sha256sums_aarch64=('cd7bf3064b9df2f46bf425e5c10d1cd73d988678e384728702ae65972d8cf126')
sha256sums_armhf=('6056656aa24660bbd82417749b2d40725cd4d85064af28341b1eb7770169aa7d')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
