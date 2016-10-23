# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Sandor Czettner <sandor@czettner.hu>

pkgname=zendframework
pkgver=1.12.20
pkgrel=1
pkgdesc="An object-oriented web-application framework for PHP projects"
arch=('any')
url="http://framework.zend.com/"
options=(!strip)
license=('BSD')
depends=('php>=5.2.11')
optdepends=()
source=("https://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver.tar.gz")
sha256sums=('984396e529a2de11bd29ba9662fbf652a1f1052ed18b69a06fa7602fdce84f83')

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
