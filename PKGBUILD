# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('e67039f4994e1d8f2d2f368853b89ca51132c7f3433a2ce804516f68ab961812')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

