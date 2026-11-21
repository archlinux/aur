# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=ui-craft
pkgname=$_pkgname-bin
pkgver=1.0.21
pkgrel=1
pkgdesc='Installer CLI for the UI Craft design system for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/educlopez/ui-craft'
license=('MIT')
optdepends=('npm: npx runtime used by the MCP-gate and detector components')
provides=("ui-craft=$pkgver")
conflicts=('ui-craft')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6a77f486e0f05e38ff62aaed7473a06e0f8038dc04ccd1b9f7e1280cf1aea874')
sha256sums_aarch64=('5eb1f55601030f186f4ac0b602fef14fac58623081bebd55b06c7d9745f53609')
options=('!debug')

package() {
	install -Dm755 ui-craft "$pkgdir/usr/bin/ui-craft"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
