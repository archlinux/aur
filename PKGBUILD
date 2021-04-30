# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.18.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4e6231faf37af2e1a36565d1ca1f3169a38c46405b93ae51a4022a66e9c6f01d')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
