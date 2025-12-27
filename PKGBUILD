# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-katex
pkgver=0.10.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to render LaTeX equations in HTML"
url="https://github.com/lzanini/mdbook-katex"
arch=('x86_64')
license=('MIT')
makedepends=()
depends=(
  'mdbook'
)
source=("${url}/releases/download/${pkgver}-alpha-binaries/${pkgname}-v${pkgver}-alpha-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0db559af17213cdb4f466cb4210d8ed557032eaddc9763ad97f51c98bd9aec07')

package() {
  cd "${srcdir}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

