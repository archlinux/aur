# Maintainer: Enrique <1enrique3@protonmail.com>

pkgname=rokit-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Next-generation toolchain manager for Roblox projects."
arch=('x86_64' 'aarch64')
url="https://github.com/rojo-rbx/rokit"
license=('MIT')
source_x86_64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/rojo-rbx/rokit/releases/download/v$pkgver/rokit-$pkgver-linux-aarch64.zip")
sha512sums_x86_64=('8a3793a7ec4061dc6c83c47b544d074a48a00b1508cf58a5ea7d86f2985e4b886e6f2d41bcfc6fe80f2578021b04912918b690a974310145c7b68df31544c2f8')
sha512sums_aarch64=('de1639d1b7cca516104a2e463401baf25b4111ae61a914f7dd8263f1676871aa5579f3eaf2b923bb8e42724cdb682da6a3cf305d43b7e67dff99feecc6483bbb')

package() {
	install -Dm755 rokit "$pkgdir/usr/bin/rokit"
}
