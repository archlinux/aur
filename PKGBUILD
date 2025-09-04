# Maintainer: <mmoya at mmoya dot org>
pkgname=opcode-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A powerful GUI app and Toolkit for Claude Code - Create custom agents, manage interactive Claude Code sessions, run secure background agents, and more."
arch=('x86_64')
url="https://github.com/getAsterisk/opcode"
license=('AGPL-3.0')
depends=('claude-code')
source=("https://github.com/getAsterisk/opcode/releases/download/v${pkgver}/opcode_v${pkgver}_linux_x86_64.deb")
sha256sums=("6fb13275d6e6d6f3076c637b3b9e72164ccc9611c78e4ac54d89b2484c7d2a02")

package() {
    ar x "opcode_v${pkgver}_linux_x86_64.deb"
    tar -xvz -C "$pkgdir" -f data.tar.gz
}
