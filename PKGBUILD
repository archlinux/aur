# Maintainer: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
_pkgname=pscale
pkgver=0.107.0
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
sha256sums=('df02580a148ff35e600b5b7101a5baf8e9a7d12655c86b2c1abcde0bf1040140')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
