pkgname=intqual-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A network diagnostic tool (binary)"
arch=('x86_64')
url="https://github.com/RaijuMounun/intqual"
license=('MIT')
provides=('intqual')
conflicts=('intqual')
source=("intqual-linux-amd64::https://github.com/RaijuMounun/intqual/releases/download/v$pkgver/intqual-linux-amd64")
sha256sums=('64207b08aa9824c6153cdfc78824965cf711c6fe592424376545008f008dc748')

package() {
  install -Dm755 "intqual-linux-amd64" "$pkgdir/usr/bin/intqual"
}
