# Contributor: hu3rror <hu3rror@protonmail.com>
# Contributor: Asuka Minato

pkgname="space-cli-bin"
_pkgname="space"
pkgver="0.4.2"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('aarch64' 'x86_64')
url='https://deta.space'
license=('MIT')
depends=()
provides=('space')
source_x86_64=("$_pkgname-x86_64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-x86_64.zip")
source_aarch64=("$_pkgname-arm64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-arm64.zip")
sha256sums_aarch64=('ff10ebb0111b84b2fc9a4ccb75e515bccac8ddff94cf6deeae6bb4bef64d8f12')
sha256sums_x86_64=('e0b458a8a967bdfa14dbc81a82f35db420ce6adb5562311ac474165f94084624')

package() {
	install -Dm755 space -t "$pkgdir/usr/bin"
}
