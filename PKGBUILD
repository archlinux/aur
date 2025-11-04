# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.19.0
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
sha512sums=("13210898726f5e4be331ab33944f0fb4034376bc37bdd4715b4914bbf7397449e73660466f79cd23c299d39952603dbc9113adf7b9911cd617c28c732cf3d49b")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
