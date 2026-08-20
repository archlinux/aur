# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=acton-ai-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="An agentic AI framework built on the actor model — scriptable CLI with persistent sessions"
arch=('x86_64')
url="https://github.com/Govcraft/acton-ai"
license=('MIT')
provides=('acton-ai')
conflicts=('acton-ai')

source=("${url}/releases/download/v${pkgver}/acton-ai-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('321701aaf95fdc65deb4ce7dcf035440f2ba03c9061729187de1390ccd3a4277')

package() {
    install -Dm755 "acton-ai-${pkgver}-x86_64-unknown-linux-gnu/acton-ai" "${pkgdir}/usr/bin/acton-ai"
}
