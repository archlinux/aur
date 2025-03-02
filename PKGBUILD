# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64' 'aarch64')
url="https://github.com/code-inflation/cfspeedtest/"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname::-4}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname::-4}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('be44a492427a07176a2f4dc19325b5e16f1e6242be9af31b213c7fde3fa32a99')
sha256sums_x86_64=('d2b280764eea7f725d99275859784363ccb4defc9ffcd597795cfc371069ae9b')
sha256sums_aarch64=('6f113bf6c64c4967101917b28490e84226d4a59b219a9dbb80fe262323180a8e')
validpgpkeys=()

package() {
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-4}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
