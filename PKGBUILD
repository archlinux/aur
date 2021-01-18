# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Franck Stauffer

pkgname='firefox-extension-canvasblocker'
pkgver=1.5
pkgrel=1
pkgdesc="A Firefox extension to protect from being fingerprinted"
license=('MPL2')
arch=('any')
url="https://github.com/kkapsner/CanvasBlocker"
depends=("firefox")
groups=('firefox-addons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kkapsner/CanvasBlocker/archive/$pkgver.tar.gz")
sha256sums=('d47b74c5413e01026ae4b16097b2442febcdfec83068e3984567cb6ed2c3ef7c')

package() {
  cd "CanvasBlocker-$pkgver"
  install -Dm644 canvasblocker.xpi "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
