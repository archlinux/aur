# Maintainer: Nathan Chere <git@nathanchere.com.au>

pkgname=gurk-bin
pkgver=0.6.2
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
sha1sums_x86_64=('ed374114c371f75a4c46bda05c67bffc70f35d30')
sha1sums_aarch64=('0403a1d72d9aa98a0dd6c1eb66b58b4c42aee89f')

package() {
  install -Dm755 gurk "${pkgdir}/usr/bin/gurk"
}
