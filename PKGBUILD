# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Sandor Czettner <sandor@czettner.hu>

pkgname=zendframework
pkgver=1.12.18
pkgrel=1
pkgdesc="An object-oriented web-application framework for PHP projects"
arch=('any')
url="http://framework.zend.com/"
options=(!strip)
license=('BSD')
depends=('php>=5.2.11')
optdepends=()
source=("http://framework.zend.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver.zip")
sha256sums=('f44fdda2d0edca5959fe659178737c69cbe576ca4c23368d7338fa9a628f9a0b')

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
