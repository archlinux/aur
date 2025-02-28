# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
_pkgname=pylyzer
pkgver=0.0.82
pkgrel=2
pkgdesc='A fast static code analyzer & language server for Python'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname "${_pkgname}-git")

source_aarch64=("pylyzer-${pkgver}-aarch64.tar.gz::https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("pylyzer-${pkgver}-armv7h.tar.gz::https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("pylyzer-${pkgver}-x86_64.tar.gz::https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-x86_64-unknown-linux-gnu.tar.gz")

sha256sums_aarch64=('6e1a624547b8efd3c8290f034aea98eb6ab869cf9b96cb12bc19b58e6e42629c')
sha256sums_armv7h=('56eb2424747bec1b339a5a010acf5ac014da6f947669f5e2f7ecedd9c612ffa4')
sha256sums_x86_64=('5e328a69a1b0dad8b72b6fcac7b10cd3fafe1d8d9a72d92addefbd96344ca494')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
