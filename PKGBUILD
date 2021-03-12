# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('398e2cfd3c481742aa89b83a413828fdab937deb73b84c5ee9b065eced925ffc')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
