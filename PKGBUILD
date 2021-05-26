pkgname=ca-certificates-neonetwork
pkgver=20210526
pkgrel=1
pkgdesc="NeoNetwork root certificates for *.neo"
arch=('any')
url="https://github.com/NeoCloud/NeoNetwork"
license=('unknown')
depends=('ca-certificates-utils')
source=('https://github.com/NeoCloud/NeoNetwork/raw/82420bf02fde9e224f697d49e1044fe55b176644/ca/neonetwork.crt')
sha256sums=('2e8c8659aad74ff642ae8a594963adf54cfbeae63e841e188db3682d64e0e5d7')

package() {
  local certdir="$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -Dt "$certdir" -m 644 neonetwork.crt
}
