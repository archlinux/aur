# Maintainer: Reverier-Xu <reverier.xu@outlook.com>

pkgname=wsrx-bin
_pkgname=${pkgname%-bin}
pkgver=1.0
pkgrel=1
pkgdesc="WebSocket Reflector X"
arch=('x86_64')
url="https://github.com/XDSEC/WebSocketReflectorX"
license=('custom')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/XDSEC/WebSocketReflectorX/releases/download/v${pkgver}/wsrx-${pkgver}-linux-amd64.tar.gz")
sha256sums=('ba2a0414a7081940c3e3b6314b2451e2b0658e01debd9b41b5f2b791ce65fd1d')

package() {
  tar -xvf wsrx-${pkgver}-linux-amd64.tar.gz -C ${pkgdir}

  install -Dm755 wsrxs ${pkgdir}/usr/local/bin/wsrxs
  install -Dm755 wsrxc ${pkgdir}/usr/local/bin/wsrxc
}
