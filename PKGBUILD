# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=spacelet
pkgver=0.1.0
pkgrel=1
pkgdesc="Overview of rivermonad's workspaces with live window thumbnails"
url='https://github.com/prietus/spacelet'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell' 'grim>=1.5' 'rivermonad>=0.4.3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e382577b1208472c4cccca25c35bcedf4784179e52eefe7ad1de6e26535e4f14')

package() {
  cd $pkgname-$pkgver
  install -Dm755 spacelet -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
