# Maintainer: Christopher Ferreira <aumgn@free.fr>

pkgname=gitbatch-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A TUI to manage your git repositories in one place"
url="https://github.com/isacikgoz/gitbatch"
license=('MIT')
arch=('x86_64')

source_x86_64=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_amd64.tar.gz)
sha512sums_x86_64=('ddc8aeedcdf3457f13ecc478300ebddc7b11b8079dac01caf631e32871e35a34a8a7952f9de0c406107909a3545795d623e47e04735d6a773b68513be9e13e9c')

package() {
  tar xzf ${srcdir}/gitbatch_${pkgver}_linux_amd64.tar.gz
  install -Dm755 ${srcdir}/gitbatch "${pkgdir}/usr/bin/gitbatch"
}
