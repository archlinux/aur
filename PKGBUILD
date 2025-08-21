# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.15.4
pkgrel=1
epoch=
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://nvim-neorocks.github.io/"
depends=(glibc 
gcc-libs 
libgpg-error 
gpgme 
bzip2 
xz)
provides=(lx)
provides=()
conflicts=(lux-cli-git)
replaces=()
options=(!lto)
source=("lx-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/lx_${pkgver}_x86_64.tar.gz")
sha512sums=("1c4d054a216bc47e3515d08670289316c45126a91e06a8773753c400d095400370e70092cf13a1c7f1af4613106e46067f62381c6a63a1dcdc5c29fce3a032b4")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
