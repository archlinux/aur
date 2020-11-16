# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Franck Stauffer

pkgname='firefox-extension-canvasblocker'
pkgver=1.4
pkgrel=2
pkgdesc="A Firefox extension to protect from being fingerprinted"
license=('MPL2')
arch=('any')
url="https://github.com/kkapsner/CanvasBlocker"
depends=("firefox")
groups=('firefox-addons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kkapsner/CanvasBlocker/archive/$pkgver.tar.gz")
sha256sums=('c515fcd565786399656ed3d22632a5590b5ef9aefea600ba7993e68a4488159e')

package() {
  cd "CanvasBlocker-$pkgver"
  install -Dm644 canvasblocker.xpi "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
