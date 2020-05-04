# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('b070f458398deb9f81eff93858b61aa0303e9c38972fadc2b3a03ccb7175a267')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

