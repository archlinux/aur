# Maintainer: tercean <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.19.1
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3e246a60e4ace03c394e18590ec0ec1a0cb14393008833acd75a6889fe91ffc2')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
