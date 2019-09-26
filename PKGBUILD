# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('507a765ce4fab98ba15561dd6ae8dae43618db4ba683e5027286a65677e7b89d')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

