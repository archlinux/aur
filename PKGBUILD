# Maintainer: Sematre <sematre at gmx dot de>
pkgname=piknik-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Copy/paste anything over the network."
arch=('x86_64')
url="https://github.com/jedisct1/${pkgname%-bin}"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux_x86_64-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/jedisct1/${pkgname%-bin}/${pkgver}/LICENSE")
sha256sums=('b429f333dd3b0849b40237e522a2f1db4b3b69c64023b7a9e8150664df39bb95'
            '07d61be5b330f032cc7c2e384c5800ea9e931e60a9b2630935bd19fed36fc4cf')

package() {
  install -Dm 755 "linux-x86_64/${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
