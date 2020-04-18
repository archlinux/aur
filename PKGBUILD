# Maintainer: Art Dev <artdevjs at gmail dot com>

pkgname="lscolors"
pkgver=0.7.0
pkgrel=1
pkgdesc="A Rust library to colorize paths using LS_COLORS"
arch=("x86_64")
url="https://github.com/sharkdp/lscolors"
license=("MIT")
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=("lscolors")
source=("https://github.com/sharkdp/lscolors/releases/download/v${pkgver}/${pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")

package() {
  install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('7c6fddef3d58868eda5c33d7f00239099e16e267475c5334e395c68285b941f1')
