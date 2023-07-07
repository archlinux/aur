pkgname=electrs-systemd
pkgver=1
pkgrel=1
pkgdesc="systemd service for electrs"
arch=(any)
license=('Apache')
depends=('bitcoin-daemon' 'electrs')
source=("electrs.service")
b2sums=("c6cc1e1555a564892468c6674879c2789fbcc44939d1cb9264b98c840f1b93eb6cb946eb99b03ce23f9bb855728f28fcfb0edbfe506e8ab7ffdc85b4b4279151")

package() {
  install -Dm644 "$srcdir/electrs.service" "$pkgdir/usr/lib/systemd/system/electrs.service"
}
