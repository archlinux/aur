# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=gurk-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='CLI client for Signal'
arch=('x86_64')
url='https://github.com/boxdot/gurk-rs'
license=('AGPL3')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${url}/releases/download/v${pkgver}/gurk-x86_64-unknown-linux-gnu.tar.gz")
sha1sums=('SKIP')

package() {
  install -Dm755 gurk "${pkgdir}/usr/bin/gurk"
}