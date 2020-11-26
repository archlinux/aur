# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.10.6
pkgrel=1
pkgdesc='Pomerium is an identity-aware access proxy'
arch=('x86_64')
url="https://www.pomerium.io"
license=('Apache')
provides=('pomerium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-amd64.tar.gz")
sha256sums=('3a5b82ebd713bcb22804227c68a479cdfb19f3b1148f00892dfaf2b404c785b5')

package() {
  install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/pomerium-cli" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et:
