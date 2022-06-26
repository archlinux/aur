# Maintainer: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
_pkgname=pscale
pkgver=0.101.0
pkgrel=0
pkgdesc='PlanetScale CLI client package for Arch'
arch=('x86_64')
url='https://github.com/planetscale/cli'
license=('Apache')
provides=('pscale')
conflicts=('pscale' 'pscale-git' 'pscale-bin')
backup=()
install="pscale.install"
source=("https://github.com/planetscale/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('370754687e1bf9f8a6a6a433bc84fc05069dc74e9d40086446a171af7a492f28')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
