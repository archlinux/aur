# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname="space-cli-bin"
_pkgname="space"
pkgver="0.3.13"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('aarch64' 'x86_64')
url='https://deta.space'
license=('MIT')
depends=()
provides=('space')
source_x86_64=("$_pkgname-x86_64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-x86_64.zip")
source_aarch64=("$_pkgname-arm64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-arm64.zip")
sha256sums_x86_64=('b2eba4f1980c37e677b31fd8729acd35f94d4245bf54c57e031fd43c04e252e8')
sha256sums_aarch64=('5101f99ac49bb29edbcf46e1a7aec051d1ae0325a744c9d461ab74f3600a8364')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s space "$pkgdir/usr/bin/space"
    install -m755 space "$pkgdir/usr/bin"
}
