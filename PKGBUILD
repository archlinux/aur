# Maintainer: Mateus Felipe Gonçalves (mateusfg7) <mateusfelipefg77@gmail.com>
# Contributor: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale
_pkgname=pscale
pkgver=0.126.0
pkgrel=0
pkgdesc='PlanetScale CLI client package for Arch'
arch=('x86_64')
url='https://github.com/planetscale/cli'
license=('Apache')
provides=('pscale')
conflicts=('pscale' 'pscale-git' 'pscale-bin' 'pscale-cli')
source=("https://github.com/planetscale/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
