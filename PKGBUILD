# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.80
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
makedepends=()
depends=()

source_aarch64=("https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-x86_64-unknown-linux-gnu.tar.gz")

sha256sums_aarch64=('cb137dfdd0f9963db3c06b30f11b09ed4397912bdea42cd0fda44ebe9e08f31b')
sha256sums_armv7h=('61835ed0fb02d3e9c07203d362861db3b35502b9f7b86cc27a89e6c8e9d65ba8')
sha256sums_x86_64=('567cd7f6a9346e8829b12c318dc4e5788cdd4bcbabc9b07760c209bd690d79ac')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
