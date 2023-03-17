# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.0.0
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$pkgname"
license=('GPL3')
depends=('gum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('51c23b41452b007ae06b8f978d51fd618816762d0d6ecf670090448ffe61f2ac')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
