# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.78
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

sha256sums_aarch64=('b97431ac1777fa145467bf17af0eb67b8d6f6d49150b541ba0caa9a5e2d6dfb8')
sha256sums_armv7h=('eefe2a6540e8b64ceb1f4bcec1b964bbfb0e7071ab0f87a7cc6c54f768a2e167')
sha256sums_x86_64=('13ed08510c36ae410cc50775413291a0ea162223ba71ae10473aa14baa670a69')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
