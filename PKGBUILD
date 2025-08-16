# Maintainer: mrcjkb, vhyrro
pkgname=lux-cli
pkgver=0.15.1
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
sha512sums=("6fd991cd31e36f49fb26fe6858db7dc00d81d6fb857c4ec8b60a5f8a369368fd5e3e099c8a19e556535f1d712ace253372b19ac8c05a80805dab8ae8ba1097b7")
package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
