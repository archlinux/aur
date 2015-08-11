# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2
pkgver=2.4.6
pkgrel=1
pkgdesc="An object-oriented framework for PHP - Full version"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
depends=('php>=5.3.23')
options=(!strip)
optdepends=()
conflicts=('zendframework2-min' 'zendframework2-git')
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver.tgz")
sha256sums=('b3554004391338aad2dcdfb1721b3b1ba25648db43066d6522e555f3c2e2caac')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -R . "$pkgdir/usr/share/$pkgname"
}
