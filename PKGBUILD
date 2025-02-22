# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.81
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

sha256sums_aarch64=('a167320230e28c4e1314fd71f9f85409c93c5dd2fc471006895458926a6b95b0')
sha256sums_armv7h=('3db6ab561d0587de46bd658107561e433c432a79158d8e7aeca287586bfeec78')
sha256sums_x86_64=('a140e628a422f98a24e0f3ad1c7e17ee49eac6624f1d11aadef5095e71debed8')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
