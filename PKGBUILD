# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.18.5
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
sha512sums=("199156690eba3f9c6cab29060f3a0aad4b1dbb57487ac308626e9fddebee5f4b4bd3ed0f4e115e6e4940a01c9ae4a41c88c2c790aefb02b114b2e4b7191ade6f")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
