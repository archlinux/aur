# Maintainer: Bachitter Chahal <bachitterch@pm.me>

pkgname=pscale-cli
_pkgname=pscale
pkgver=0.106.0
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
sha256sums=('c7a32583461f16ff498a21e3885f127cb5851fd46627f4857325a1f160012b8a')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
