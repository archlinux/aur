# Maintainer: Assaf Sapir <assapir@users.noreply.github.com>
pkgname=golem-bin
pkgver=0.17.0
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
sha256sums_x86_64=('30a70dad0b1afbb10af00f7486428601f3a6cee46ed5028e84d2aa0b837a1280')
sha256sums_aarch64=('01c0617a958385f7962f573bf5514091ba8ccd25cef5132d10967581a177f31e')

package() {
    install -Dm755 "golem-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/golem"
}
