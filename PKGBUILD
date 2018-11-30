# Maintainer: Eirik Albrigtsen <sszynrae at gmail dot com>
pkgname=jenq
pkgver=0.1.2
sha256sums=('697225ba617e06791e10a3af1faac3a0cddffce2d983cf5c415881cdf115bbf4')
pkgrel=1
pkgdesc="Query jenkins for jobs matching filters"
license=("Apache-2.0")
arch=("x86_64")
source=("https://github.com/clux/jenq/releases/download/${pkgver}/jenq.x86_64-unknown-linux-musl.tar.gz")

package() {
    cd "${srcdir}/"
    install -Dt "${pkgdir}/usr/bin" "bin/jenq"
}
