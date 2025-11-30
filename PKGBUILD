# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.20.2
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
sha512sums=("bb7a24c0eaaa471c4faba542ca915168b536cb530245d4a00688c70f83f22e6cfb609c269a053a621975aebefe592c51d14252eaf21e4e0dd3b938506d65c4ad")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
