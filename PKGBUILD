# Maintainer: mrcjkb, vhyrro
pkgname=lux-cli
pkgver=0.15.2
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
sha512sums=("898d0b3625ba8f0cd9ce7065d79907e0e76d00c0df7c81d26b54d40ec85bb591751036f9544c01ea897908f8ae6a1110e86750d4156f0f28b8844381ce2d43c8")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
