# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=samplo-clap-bin
_pkgname=samplo
pkgver=0.9.0
pkgrel=1
pkgdesc="Headless Rust CLAP sfz instrument loader (basic)"
arch=('x86_64')
url="https://github.com/mlm-games/samplo-clap"
license=('MIT')
depends=('glibc')
optdepends=('clap-host: A CLAP host to load the plugin (not required by yadaw)')
provides=('samplo-clap')
conflicts=('samplo-clap')
options=('!strip')

source=("Samplo-${pkgver}.clap::https://github.com/mlm-games/samplo-clap/releases/download/v${pkgver}/Samplo-linux.clap")
sha256sums=('2a81b31d4e00d06564dfc367dd1b0c3daddcca3fcf8b0358c4dab2bb7b0fc685')

package() {
  install -Dm755 "${srcdir}/Samplo-${pkgver}.clap" \
    "${pkgdir}/usr/lib/clap/Samplo.clap"
}
