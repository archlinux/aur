# Maintainer: Metal A-wing <1 at 233 dot email>

pkgname=argus
pkgver=3.0
pkgrel=1
pkgdesc="auxiliary reliable guardian undertaking system"
arch=('any')
url="https://github.com/JRT-FOREVER/argus"
license=('MIT')
depends=('python' 'python-bottle')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
md5sums=('69586372e9c89efa1f57b979f224b5be')

#source=("git+${url}")
#sha256sums=('SKIP')

package() {
  #cd ${pkgname}
  cd $pkgname-$pkgver
  PREFIX=$pkgdir make install
}

