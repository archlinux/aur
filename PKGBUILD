# Maintainer: Barry Ira <barry@jorts.space>

pkgname=pscale-bin
_pkgname=pscale
pkgver=0.113.0
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
sha256sums=('7bdf3aacf4e8553d03a57cad7b51cb434d07fc56400b407b1230a55c5a1ee9f7')

package() {
  install -Dm755 pscale ${pkgdir}/usr/bin/pscale
}

# vim:set ts=2 sw=2 et:
