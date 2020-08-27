# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='Pomerium is an identity-aware access proxy'
arch=('x86_64')
url="https://www.pomerium.io"
license=('Apache')
provides=('pomerium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-amd64.tar.gz")
sha256sums=('6d70cf9a84c9dc2d8e6efb37f13a3aa78d4d5b1cb8f1b7c3d8b128b7196f6e20')

package() {
  install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/pomerium-cli" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: