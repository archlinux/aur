# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=blt4l-runtime-bin
pkgver=1.3
pkgrel=1
pkgdesc="Mod loader for Payday 2 (Steam runtime, bin version)"
arch=('i686' 'x86_64')
url="https://github.com/blt4linux/blt4l"
license=('GPL3')
groups=()
depends=('curl' 'openssl' 'zlib')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=blt4l.install
__filename="blt4l_${pkgver/_/-}_Ubuntu-precise-steamrt"
source=("https://github.com/blt4linux/blt4l/releases/download/${pkgver/_/-}/${__filename}.tar.xz")
noextract=()
md5sums=('f15430924274f36eb7ee2bb779c3ea13')
sha512sums=('07bbbaf7c7f6c73cd724d86e41f058d3e86aa0acafffb337001615b727ed050b40920b4f6df8a10f516d47ef5f66c8ff3306df974e598c88bc99fa6de1cc7a33')

package() {
	install -D -m644 "${srcdir}/${__filename}/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader_steamrt.so"
}
