# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=electron-fiddle-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('0f8cae8eca133c5f741a7f347b3b533b84891f7ba1b51ec9811d2093fda573e2')
sha256sums_aarch64=('8bb43d41ce55a99b4e33339e1ce4202e23b1187708b29a8363d8dde14dd3903a')
sha256sums_armhf=('7d70df0889f90dd096c7befdc5ea4748d1ca2280a2540c7ad4e675f24c94d371')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
