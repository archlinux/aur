# Maintainer: Christopher Ferreira <aumgn@free.fr>

pkgname=gitbatch-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A TUI to manage your git repositories in one place"
url="https://github.com/isacikgoz/gitbatch"
license=('MIT')
arch=('x86_64')

source_x86_64=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_amd64.tar.gz)
sha512sums_x86_64=('4fa68ee5ccd1d886d509966af6ff0c888f8ca292b07e4696772edead648382575479ba47e0707c9f31530546c9c05a5ba371f5522b8118e885c8a9a3b02ee232')

package() {
  tar xzf ${srcdir}/gitbatch_${pkgver}_linux_amd64.tar.gz
  install -Dm755 ${srcdir}/gitbatch "${pkgdir}/usr/bin/gitbatch"
}
