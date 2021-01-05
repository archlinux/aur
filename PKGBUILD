# Maintainer: Sematre <sematre at gmx dot de>
pkgname=piknik-bin
pkgver=0.9.1
pkgrel=2
pkgdesc="Copy/paste anything over the network."
arch=('x86_64')
url="https://github.com/jedisct1/${pkgname%-bin}"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux_x86_64-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/jedisct1/${pkgname%-bin}/${pkgver}/LICENSE")
sha256sums=('6343075652835a0508bbc3e6404529d5abdb6c835508a91cfaeddfb759e86f73'
            '8d01c136e17dca304a9206d4810ff08da4d1a9aa87f7b4740e42d46ebf9bc1be')

package() {
  install -Dm 755 "linux-x86_64/${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
