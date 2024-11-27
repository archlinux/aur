# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.72
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

sha256sums_aarch64=('73edce2eb940be9097c255d3d620b67265f895b958b2c5621b694813835470aa')
sha256sums_armv7h=('929b01b7127cdad6e2c6ece4c7778c636d8a1ec77fa16c1325303b6463c80dd6')
sha256sums_x86_64=('4c0332f54a25e8c40a67c26486e68f92d8464c1c3e3bc17a938169c6c3d78e56')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
