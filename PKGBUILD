pkgname=agent-deck-bin
pkgver=1.7.50
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=(tmux glibc)
options=(!strip !debug)
conflicts=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.7.50/agent-deck_1.7.50_linux_amd64.tar.gz")
sha256sums=('1415f37a4031d929f92562ad2faee7e2f3a31142382305488b11dce2b827ca63')

prepare() {
    tar -xf "${source}"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
}