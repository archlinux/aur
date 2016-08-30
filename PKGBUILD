# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=blt4l-runtime-bin
pkgver=1.2_r1
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
md5sums=('3c5615ad3d370e939b40eca88c81e8e7')
sha512sums=('e4ee78051a724686d2844e80b14feecaef46d9db61216f8daa5718563280e37d905b08b0608ee019768daab547b7e4acb0626f1b752501cd0b070bad0d748d37')

package() {
	install -D -m644 "${srcdir}/${__filename}/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader_steamrt.so"
}
