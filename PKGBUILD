# Maintainer: Chris Mullins <christopher.r.mullins at gmail dot com> 
# Contributors: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kitti3
pkgver=0.4.1
pkgrel=2
pkgdesc="Kitty drop-down service for i3wm"
arch=('any')
url="https://github.com/LandingEllipse/kitti3"
license=('BSD')
depends=('i3-wm'
     'kitty'
     'python'
     'python-i3ipc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e9b67d5a22ece7cfc384adb6c77f920b37e1623b66630619e85fe24d7f776fd52c988a8f5c64dd84b95d35c8c840f7efa083961020c41517a6e59cf7d4b87f39')

package() {
  install -Dm755 "$pkgname-$pkgver/src/kitti3/main.py" "${pkgdir}/usr/bin/kitti3"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
