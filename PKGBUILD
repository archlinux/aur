# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname="deta-cli-bin"
_pkgname="deta"
pkgver="1.3.3"
pkgrel="1"
pkgdesc="Command line interface for managing Deta micros and deployments."
arch=("x86_64" "aarch64")
url="https://www.deta.sh"
license=("MIT")
depends=()
provides=("deta")
conflicts=("deta")
source_x86_64=("$_pkgname-x86_64-linux.zip::https://github.com/deta/deta-cli/releases/download/v1.3.3-beta/deta-x86_64-linux.zip")
source_aarch64=("$_pkgname-arm64-linux.zip::https://github.com/deta/deta-cli/releases/download/v1.3.3-beta/deta-arm64-linux.zip")
sha256sums_x86_64=('9acbad3d95bb1c2352e3fb6a0233e1edfe259f71434872c4942db9da08a7f8b3')
sha256sums_aarch64=('884ca78a1164a20bcbed64dda4de5b10bf7e1a84e67eef52d08449a0e7dcdbce')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s deta "$pkgdir/usr/bin/deta"
    install -m755 deta "$pkgdir/usr/bin"
}
