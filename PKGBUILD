# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.51
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python'
arch=('x86_64')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
makedepends=()
depends=()

source=("https://github.com/mtshiba/pylyzer/releases/download/v${pkgver}/pylyzer-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('04e6800f927511e9a980fb9204f0be4e5267abb4d9a16369b65897b07917089e')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
