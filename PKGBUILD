# Maintainer: Assaf Sapir <assapir@users.noreply.github.com>
pkgname=golem-bin
pkgver=0.26.0
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
sha256sums_x86_64=('47d1d0a484ad78fea92d18ac77a41dc683ef7ba706225f01d9255a2f63db9112')
sha256sums_aarch64=('5775d6044319041c5d766fdb710ee2b765cb6faf5f71900ff4fd1f9de8b15916')

package() {
    install -Dm755 "golem-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golem"
}
