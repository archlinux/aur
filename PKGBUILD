# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=acton-ai-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="An agentic AI framework built on the actor model — scriptable CLI with persistent sessions"
arch=('x86_64')
url="https://github.com/Govcraft/acton-ai"
license=('MIT')
provides=('acton-ai')
conflicts=('acton-ai')

source=("${url}/releases/download/v${pkgver}/acton-ai-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4a5d185683743ca8f1d8f5b6bf4d2b9986122f7b4955ad37308043092964cf5a')

package() {
    install -Dm755 "acton-ai-${pkgver}-x86_64-unknown-linux-gnu/acton-ai" "${pkgdir}/usr/bin/acton-ai"
}
