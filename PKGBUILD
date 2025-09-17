# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.18.0
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
sha512sums=("826909ad2a179103f26443e6010188472b0723485fb382f187398857e791946e71797862f234fb6292406ea99e6e047beb4d141f4834ecd22e4f848a0b227af9")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
