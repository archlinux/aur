# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4f935e6ceef9c31ef33f197dda40dc9f2afb22f84c0e2997c0a3792220aa9662')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

