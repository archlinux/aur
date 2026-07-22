# Maintainer: Bebbssos
# Template — placeholders (0.2.0 / @SHA256_*@) are filled in by
# pkg/aur/render.sh at release time. Do not edit the rendered output by hand;
# edit this file and let the release workflow re-render it.
pkgname=ixr-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Unofficial Rust port of the Internxt CLI (faster, single static binary, streaming transfers)"
arch=('x86_64' 'aarch64')
url="https://github.com/Bebbssos/internxt-cli-rust"
license=('MIT')
provides=('ixr')
conflicts=('ixr')

source_x86_64=("https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d4a14e9fb264ee4affa0ebffefe17df20ce7d725dd1fd174444d13adaaa01e21')
sha256sums_aarch64=('d278a5f69a28ba720a1b489a936106353bcab1df9bdcd2a708e8ed5a1ce23f4d')

package() {
  install -Dm755 "${srcdir}/ixr" "${pkgdir}/usr/bin/ixr"
}
