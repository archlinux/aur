# Maintainer: Mike Cronce <mike@cronce.io>

pkgname=pscale-bin
_pkgname=pscale
pkgver=0.40.0
pkgrel=1
pkgdesc='The command-line client for Planetscale DBaaS'
arch=('x86_64')
url='https://github.com/planetscale/cli'
license=('Apache')
provides=('pscale')
conflicts=('pscale' 'pscale-git')
backup=()
install="pscale.install"
source=("https://github.com/planetscale/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c7ce4b060cef1a9924ae43bb3197b39d655439540d3f42517c4d3201669cbdeb')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
