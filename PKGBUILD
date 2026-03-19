# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=acton-ai-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="An agentic AI framework built on the actor model — scriptable CLI with persistent sessions"
arch=('x86_64')
url="https://github.com/Govcraft/acton-ai"
license=('MIT')
provides=('acton-ai')
conflicts=('acton-ai')

source=("${url}/releases/download/v${pkgver}/acton-ai-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('85d8bcba28ab049bd9091ad44a1b675bcc383a42f31ba5aaa79517c601445ede')

package() {
    install -Dm755 "acton-ai-${pkgver}-x86_64-unknown-linux-gnu/acton-ai" "${pkgdir}/usr/bin/acton-ai"
}
