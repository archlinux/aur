# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bruce Zhang

pkgname=electron-fiddle
pkgver=0.29.1
pkgrel=1
pkgdesc="The easiest way to get started with Electron"
arch=('x86_64' 'aarch64' 'armhf')
provides=("${pkgname%-bin}")
url='https://github.com/electron/fiddle/'
license=('MIT')
depends=('gtk3' 'alsa-lib' 'nss' 'electron')
source_x86_64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_amd64.deb")
sha256sums_x86_64=('18ed3420c16cfb4ee04affb6a0c090ff8413e36446b2496bfbb29db80d5e25c6')
sha256sums_aarch64=('12ef2ec86ef5a31080d099cbded4e2b6f632c75aa36bf8afb40dcff4143cddf6')
sha256sums_armhf=('0049002f075aaef18e6f68ddefbf201d5678e6190fb39f83b604333dcd1732f3')
source_aarch64=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_arm64.deb")
source_armhf=("https://github.com/electron/fiddle/releases/download/v${pkgver}/electron-fiddle_${pkgver}_armhf.deb")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
