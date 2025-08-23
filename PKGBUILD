# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.16.1
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
sha512sums=("89a310e3c660e1287fffc3aad225cb9cb844690b65c187aeaf552c273b818d0857c93de707ef404dec25f4ad27c7c2b78cefcbb2e741878987397f7b7965118b")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
