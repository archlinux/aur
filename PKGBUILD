# Maintainer: Assaf Sapir <assapir@users.noreply.github.com>
pkgname=golem-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="A clay body, animated by words. Rust AI agent with ReAct loop, pluggable tools, and SQLite memory."
arch=('x86_64' 'aarch64')
url="https://github.com/assapir/golem"
license=('GPL-2.0-only')
provides=('golem')
conflicts=('golem')
depends=()

source_x86_64=("golem-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/golem-x86_64-linux")
source_aarch64=("golem-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/golem-aarch64-linux")
sha256sums_x86_64=('126c3395f51a3b159b87420d4116d70dfe3d85acf6086ab5a72b138461e2e4b7')
sha256sums_aarch64=('f2dc7c37572a43fcee78972a5fc3c80a934f2fc88b4fc81d98855ae17a92e893')

package() {
    install -Dm755 "golem-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golem"
}
