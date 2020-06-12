# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Pomerium is an identity-aware access proxy'
arch=('x86_64')
url="https://www.pomerium.io"
license=('Apache')
provides=('pomerium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-amd64.tar.gz")
sha256sums=('d1c5d9e55be66cd1a8b70366a61999714127c2cf6e3acc2c37f8cc9bb461c55c')

package() {
  install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/pomerium-cli" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: