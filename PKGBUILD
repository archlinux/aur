# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.32.1
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('5e6e1f1ffaa9739d96e2a64a401fad7d802300c9cb18ba6b3ada4379cc1e5ac0')
sha256sums_aarch64=('f259d3ca7bcaea7e5b9f22245814360bc1dccd6481516dd732817c993371786b')
sha256sums_armhf=('639beef499c9e19c908c27dd0616fb0f9418d9ccc707ab3f937c7bd915202bfd')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar --zstd -xf "$srcdir/data.tar.zst" -C "$pkgdir/"
}
