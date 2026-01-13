# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.22.4
pkgrel=1
epoch=
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://lux.lumen-labs.org/"
repo_url="https://github.com/lumen-oss/lux"
depends=(glibc
gcc-libs
bzip2
xz)
provides=(lx)
provides=()
conflicts=(lux-cli-git
lux-cli)
replaces=()
options=(!lto)
source=("lx-${pkgver}_x86_64.tar.gz::${repo_url}/releases/download/v${pkgver}/lx_${pkgver}_x86_64.tar.gz")
sha512sums=("ba7441f208290cd8e955e9f68ca0cc85bfeb957f42a8336ff304f52bc64378b854a77500a5715bd1b20f8c3fd6716783e267382dcc7c55152db6cb169bfc5244")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
