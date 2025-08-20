# Maintainer: mrcjkb, vhyrro
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.15.3
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
sha512sums=("90c85907b071f23791dfa960728a83a89f427b7e89e7020caa4da7e9e7e1e238489a892c09ca38f07e74e87f61a7ad388a3ae36c5d74a6ed33bf0deb76c9c156")

package() {
	cp -r "${srcdir}"/* "${pkgdir}"/
}
