# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kitti3
pkgver=0.2.6
pkgrel=1
pkgdesc="Kitty drop-down service for i3wm"
arch=('any')
url="https://github.com/LandingEllipse/kitti3"
license=('BSD')
depends=('i3-wm'
		 'kitty'
		 'python'
		 'python-i3ipc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6e755204f675b1d9a6b11bd8700d97c23a9a560560865798f8b59e7c4e463d12')

package() {
  install -Dm755 "$pkgname-$pkgver/src/kitti3/main.py" "${pkgdir}/usr/bin/kitti3"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}