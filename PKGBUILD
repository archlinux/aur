# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pylyzer-bin
pkgver=0.0.79
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

sha256sums_aarch64=('dcda38a9ffd94189a397257d564f38fb46b39fa5a07ba4023a6b1c2e237f020e')
sha256sums_armv7h=('d4e778e0480bdebd87f647efdad559af41c7a3daf76f3bda0f0aabf1242641cf')
sha256sums_x86_64=('66a47238fd87e671ee982031209b5254d8e42da725513b7e0494b73609bc97b8')

package() {
	install -Dm755 "pylyzer" "$pkgdir/usr/bin/pylyzer"
	install -Dm644 "${srcdir}/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
