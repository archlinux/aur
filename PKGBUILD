# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=acton-ai-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="An agentic AI framework built on the actor model — scriptable CLI with persistent sessions"
arch=('x86_64')
url="https://github.com/Govcraft/acton-ai"
license=('MIT')
provides=('acton-ai')
conflicts=('acton-ai')

source=("${url}/releases/download/v${pkgver}/acton-ai-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('171b2ea7e13043871570332b3d51a54efe28599fe9cb9b0daaaf097c53310bc2')

package() {
    install -Dm755 "acton-ai-${pkgver}-x86_64-unknown-linux-gnu/acton-ai" "${pkgdir}/usr/bin/acton-ai"
}
