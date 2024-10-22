# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-katex
pkgver=0.9.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to render LaTeX equations in HTML"
url="https://github.com/lzanini/mdbook-katex"
arch=('x86_64')
license=('MIT')
makedepends=()
depends=(
  'mdbook'
)
source=("${url}/releases/download/${pkgver}-binaries/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0b705e423bebd1f792f00a0d3f8d835f6c00ad921d620ce9d62d4fb91cea8cb9')

package() {
  cd "${srcdir}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

