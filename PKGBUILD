# Maintainer: mrcjkb, vhyrro
pkgname=lux-cli
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://nvim-neorocks.github.io/"
depends=()
provides=()
conflicts=(lux-cli-git)
replaces=()
options=(!lto)
source=("lx-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/lx_${pkgver}_x86_64.tar.gz")
sha512sums=("2ff1cc6ac587e61e8a45826f0b4cde1c33570ee6123060b89ab0f6148a191aac0d2a640b01d8105c531a5132ebad29bc623f2b189db51087b1bf22437acdff80")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
