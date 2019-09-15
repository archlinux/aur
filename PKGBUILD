# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4d3b883e2f98e71b5cd65a8fb2b9370b8f6b4bb45ba4b58ad4d2f1baf1ab47d2')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

