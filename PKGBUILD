# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli-bin
pkgver=0.20.1
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
sha512sums=("a7533050050be3b355eeda4cf6f467553ad7596c8900a01b6a94e18a2c758559e763a211e651da5332d849734c944c4a4a343053d210d1dd76d7e46fbbee0f38")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
