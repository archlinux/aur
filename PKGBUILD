# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.18.7
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
sha512sums=("260f40e717390c586a9e229c4a4f0a7ec1ddb56450775784db35edbdd9c145bc077f1b852158fda0de5ccd9d31302238f7eabbe63af0a7032ae904dae253a0c5")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
