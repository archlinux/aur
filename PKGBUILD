# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-katex
pkgver=0.9.3
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
sha256sums=('217d9f7354fa2d07505dd958c275c3042d3e746985b06d19525b03eefbce9dcb')

package() {
  cd "${srcdir}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

