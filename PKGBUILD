# Maintainer: zius <noelyt101@gmail.com>
pkgname=orbit-tui-bin
pkgver=0.11.17
pkgrel=1
pkgdesc="Extensible 24/7 terminal workspace and autonomous AI agent cockpit in Rust"
arch=('x86_64')
url="https://orbit-tui.vercel.app"
license=('MIT')
provides=('orbit' 'orbit-tui')
conflicts=('orbit' 'orbit-tui')
source_x86_64=("https://github.com/ziuus/orbit-tui/releases/download/v${pkgver}/orbit-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2611f97030415da38c17feb451fade5442315864752f8630a2991c0f93b354fc')

package() {
    install -Dm755 "${srcdir}/orbit" "${pkgdir}/usr/bin/orbit"
}
