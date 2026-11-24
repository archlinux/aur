# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=docklet
pkgver=0.1.0
pkgrel=1
pkgdesc='Dock for river and rivermonad: running and pinned applications in a pill that hides at the edge'
url='https://github.com/prietus/docklet'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell' 'rivermonad>=0.4.3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a6803940bebb65eeb9fff702eb4d93ddbd7f4f1174c333f9d09fc8d09f98050')

package() {
  cd $pkgname-$pkgver
  install -Dm755 docklet -t "$pkgdir/usr/bin"
  install -Dm644 examples/config.json -t "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
