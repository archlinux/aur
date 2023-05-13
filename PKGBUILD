# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.32.6
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('a2886cc937c84b1347e2d0ff3c65d4e027765b7da437da106bfa53a16a419f65')
sha256sums_aarch64=('ed140aa34a57d4b4b31299cd4bae217dc599ada8f9b53ab478bf574cc5cdb3eb')
sha256sums_armhf=('91ea73229aba4604ad38ffa1693e80c6797e96dcfda68f3abf5cc761fa5fe9db')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
