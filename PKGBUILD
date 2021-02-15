# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('6af31a55e751523995cfa75bd615e33ba5cc23bcf0d0fc6f274e92ce21b0bfaf')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
