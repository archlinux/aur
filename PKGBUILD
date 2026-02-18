# Maintainer: Assaf Sapir <assapir@users.noreply.github.com>
pkgname=golem-bin
pkgver=0.11.0
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
sha256sums_x86_64=('e834c0f917044965d75b2b8b0259565417211ad2880aedc5f0b54dbdb28ca98a')
sha256sums_aarch64=('0b9102910ddcf4646fed75621ace79b333a4f403daa63ca2c09fbb0e9f3d990e')

package() {
    install -Dm755 "golem-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golem"
}
