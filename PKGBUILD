# Maintainer: nickalie <nickalie@gmail.com>
pkgname=nclaw-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Telegram bot wrapping Claude Code CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/nickalie/nclaw"
license=('MIT')
provides=('nclaw')
conflicts=('nclaw')
source_x86_64=("${url}/releases/download/v${pkgver}/nclaw_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/nclaw_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 nclaw "${pkgdir}/usr/bin/nclaw"
}
