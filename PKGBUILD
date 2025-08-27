# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.17.0
pkgrel=1
epoch=
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://nvim-neorocks.github.io/"
depends=(glibc
gcc-libs
bzip2
xz)
provides=(lx)
provides=()
conflicts=(lux-cli-git)
replaces=()
options=(!lto)
source=("lx-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/lx_${pkgver}_x86_64.tar.gz")
sha512sums=("55614e63b8868450ff6876fe2d4fa86673693beef011c31a2cb6a4b63cac7d459b08248b53a5d729c5251bffe6942f30288b479688e4b307c6a6ad86b34ed88c")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
