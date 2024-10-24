# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64' 'aarch64')
url="https://github.com/code-inflation/cfspeedtest/"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname::-4}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname::-4}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c303689aeda72ab012ddbdf1ae3c9f761308229361915df1b151eabb513d1696')
sha256sums_aarch64=('287dd63497c377771fd8f69b039e526b7190a10c892e1eee1747042aaff6dafb')
validpgpkeys=()

package() {
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
}
