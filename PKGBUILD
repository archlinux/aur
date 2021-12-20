# Maintainer: Mike Cronce <mike@cronce.io>

pkgname=pscale-bin
_pkgname=pscale
pkgver=0.88.0
pkgrel=0
pkgdesc='The command-line client for Planetscale DBaaS'
arch=('x86_64')
url='https://github.com/planetscale/cli'
license=('Apache')
provides=('pscale')
conflicts=('pscale' 'pscale-git')
backup=()
install="pscale.install"
source=("https://github.com/planetscale/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('10ebbea435f3d6708a980db94f05465bd8ef0dafc8bd2c307c3767384400ee43')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
