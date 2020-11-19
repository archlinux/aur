# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=godbledger-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Accounting Software with GRPC endpoints and SQL Backends"
arch=('x86_64')
url="https://www.godbledger.com"
license=('GPL3')
depends=('glibc')
provides=('godbledger')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darcys22/godbledger/releases/download/v${pkgver}/godbledger-linux-x64-v${pkgver}.tar.gz")
sha256sums=('bf5730563abaec6fbc17602f0a1169f64c1735c4210c49ff775a20c88097f8bd')

package() {
  cd godbledger-linux-x64-v${pkgver}
  install -Dm755 reporter -t "${pkgdir}/usr/bin"
  install -Dm755 godbledger -t "${pkgdir}/usr/bin"
  install -Dm755 ledger_cli -t "${pkgdir}/usr/bin"
}
