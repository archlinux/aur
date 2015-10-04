# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Sandor Czettner <sandor@czettner.hu>

pkgname=zendframework
pkgver=1.12.16
pkgrel=1
pkgdesc="An object-oriented web-application framework for PHP projects"
arch=('any')
url="http://framework.zend.com/"
options=(!strip)
license=('BSD')
depends=('php>=5.2.11')
optdepends=()
source=("http://framework.zend.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver.zip")
sha256sums=('f53b0b0d0bca4890837f65b54833946679634322219e5c4a48ab094f4dcd1be1')

build() {
  true
}

package() {
  cd "$srcdir/ZendFramework-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -R . "$pkgdir/usr/share/$pkgname"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/bin/zf.sh" "$pkgdir/usr/bin/zf"
}

# vim:set ts=2 sw=2 et:
