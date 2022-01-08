# Maintainer: yskszk63 <yskszk63 at gmail dot com>
pkgname=dlsortls-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Launch deno lsp or typescript-language-server.'
arch=('x86_64')
url='https://github.com/yskszk63/dlsortls'
license=('MIT')
depends=('deno' 'typescript-language-server')
makedepends=()
source=("${url}/releases/download/v${pkgver}/dlsortls_${pkgver}_Linux_x86_64.tar.gz")
b2sums=('09955eb756c94bfa0f4d8a34c67f54a7d2ca47a1c9af42c7aaaacbab0833805d729d30fd4142846b9275375a2d12c82b03443b6ae11df7ceb578b1de01a0d5ed')

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 ${srcdir}/dlsortls ${pkgdir}/usr/bin
}
