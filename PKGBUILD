# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=godbledger-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Accounting Software with GRPC endpoints and SQL Backends"
arch=('x86_64')
url="https://www.godbledger.com"
license=('GPL3')
depends=('glibc')
provides=('godbledger')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darcys22/godbledger/releases/download/v${pkgver}/godbledger-linux-x64-v${pkgver}.tar.gz")
sha256sums=('2482b77aa254bb33e15ae2aeb4fd21cb029e19dd53081e9160184c90e37e4710')

package() {
  cd godbledger-linux-x64-v${pkgver}
  install -Dm755 reporter -t "${pkgdir}/usr/bin"
  install -Dm755 godbledger -t "${pkgdir}/usr/bin"
  install -Dm755 ledger_cli -t "${pkgdir}/usr/bin"
}