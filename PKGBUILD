# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('e131865fbd7b406ae7ad471fb9561f270f8b60de2cb29e1dc15485ffb60944b6')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

