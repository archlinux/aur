# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=gurk-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='CLI client for Signal'
arch=(x86_64 aarch64)
url='https://github.com/boxdot/gurk-rs'
license=('AGPL3')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/gurk-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/gurk-aarch64-unknown-linux-gnu.tar.gz")
sha1sums_x86_64=('SKIP')
sha1sums_aarch64=('SKIP')

package() {
  install -Dm755 gurk "${pkgdir}/usr/bin/gurk"
}
