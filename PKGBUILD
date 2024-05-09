# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.54
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python'
arch=('x86_64')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
makedepends=()
depends=()

source=("https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('a143782743a7aafa8b470633a03028efd60d09ecdb744468abaa4c80b048d6ab')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
