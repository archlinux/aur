# Contributor: hu3rror <hu3rror@protonmail.com>
# Contributor: Asuka Minato

pkgname="space-cli-bin"
_pkgname="space"
pkgver="0.4.1"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('aarch64' 'x86_64')
url='https://deta.space'
license=('MIT')
depends=()
provides=('space')
source_x86_64=("$_pkgname-x86_64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-x86_64.zip")
source_aarch64=("$_pkgname-arm64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-arm64.zip")
sha256sums_aarch64=('bd05b4415863fd03b5a56b2da7bb81d889b671ffd8ec27b73ce9d21ca3fc5c99')
sha256sums_x86_64=('d930ea7ecf34e7613e26325a32d3228a0fa2a588298ab5a586a2df73e1126acf')

package() {
    install -Dm755 space -t "$pkgdir/usr/bin"
}
