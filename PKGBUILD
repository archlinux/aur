# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.7.5
pkgrel=1
pkgdesc='Pomerium is an identity-aware access proxy'
arch=('x86_64')
url="https://www.pomerium.io"
license=('Apache-2.0')
provides=('pomerium')
source=("https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-amd64.tar.gz")
sha256sums=('3222577ff55e8fa611453426b5cf4137809e9b4ffc6edfb083efbde64344fefa')

package() {
  install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/pomerium-cli" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: