# Maintainer: Assaf Sapir <assapir@users.noreply.github.com>
pkgname=golem-bin
pkgver=0.27.0
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
sha256sums_x86_64=('c55c2866c8a9a2bf3956a6992482da713f3b04c06c9b0db30fa2e228e5ac66dc')
sha256sums_aarch64=('1b4d5568c14b4ca5dc3a13f0dd01f6ec1d42fd5d8b6de062118d3d9de5cab0fe')

package() {
    install -Dm755 "golem-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golem"
}
