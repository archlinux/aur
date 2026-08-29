# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=acton-ai-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="An agentic AI framework built on the actor model — scriptable CLI with persistent sessions"
arch=('x86_64')
url="https://github.com/Govcraft/acton-ai"
license=('MIT')
provides=('acton-ai')
conflicts=('acton-ai')

source=("${url}/releases/download/v${pkgver}/acton-ai-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('72cd625f23c203d0b2d6b29df4faf6c362d4e7f8e8cf0c153007bdeca3941cab')

package() {
    install -Dm755 "acton-ai-${pkgver}-x86_64-unknown-linux-gnu/acton-ai" "${pkgdir}/usr/bin/acton-ai"
}
