# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=wordle-tui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='TUI Wordle'
arch=(x86_64 aarch64)
url='https://github.com/conradludgate/wordle'
license=('N.A.')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/wordle-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/wordle-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha1sums_x86_64=('SKIP')
sha1sums_aarch64=('SKIP')

package() {
  install -Dm755 wordle "${pkgdir}/usr/bin/wordle"
}
