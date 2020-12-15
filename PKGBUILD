# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('61b2dbccbad5706460eba8ea5f8e600b39242a56e964a2b07720888fd5276494')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
