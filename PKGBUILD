# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('300ebd4bd8791f63ee41e3f3e86910d8fb577c1d6715a378d649edf5c4702c7a')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}
