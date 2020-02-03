# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4b9782fd2e2235d352b58fc9bcb8687bde46a765d3ea0ea2ffc5614ca934c85b')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

