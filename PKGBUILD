# Maintainer: Todd E Johnson (todd@toddejohnson.net)
pkgname=d-rats
pkgver=0.3.3
pkgrel=1
pkgdesc="A communications tool for D-STAR"
arch=('any')
url="http://d-rats.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk')
optdepends=('hamradio-menus' 'python2-feedparser')
sha256sums=(ab0aa371f25777fc0ab8c131f6fa43df2c5f4b18c4e5693d21c979bebcf724b9)
source=("http://www.d-rats.com/download/v0.3.x/$pkgname-$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

