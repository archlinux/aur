# Maintainer: Neal Buchanan <neal.buchanan at gmx dot com> 

pkgname=godbledger-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Accounting Software with GRPC endpoints and SQL Backends"
arch=('x86_64')
url="https://www.godbledger.com"
license=('GPL3')
depends=('glibc')
provides=('godbledger')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darcys22/godbledger/releases/download/v${pkgver}/linux-amd64-v${pkgver}.tar.gz")
sha256sums=('bae9912c2a530607d6658717cc22aec59e0caa69166fa4df57955e8361f7d69c')

package() {
  cd linux-amd64
  install -Dm755 -t "${pkgdir}/usr/bin" reporter godbledger ledger-cli ../../goledger
}
