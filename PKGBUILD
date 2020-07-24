# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('39cb4e172d2fcb5deb4bc37f8bce2642b86b774d5f39ac66d889571463cc5b1d')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
