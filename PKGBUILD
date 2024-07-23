# Maintainer: Zakros

pkgname=wsrx-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.17
pkgrel=2
pkgdesc="WebSocket Reflector X"
arch=('x86_64')
url="https://github.com/XDSEC/WebSocketReflectorX"
license=('custom')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/XDSEC/WebSocketReflectorX/releases/download/${pkgver}/wsrx-${pkgver}-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
  tar -xvf wsrx-${pkgver}-linux-amd64.tar.gz -C ${pkgdir}

  install -Dm755 wsrxs ${pkgdir}/usr/local/bin/wsrxs
  install -Dm755 wsrxc ${pkgdir}/usr/local/bin/wsrxc
}
