#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootstrap
pkgver=3.3.7
pkgrel=2
pkgdesc='A HTML, CSS, and JS framework for designing responsive, mobile first projects on the web.'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
provides=("${pkgname}" "bootstrap")
conflicts=("${pkgname}" "bootstrap")
source=("https://github.com/twbs/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-dist.zip")
sha256sums=('f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b')

package() {
  cd $srcdir/$pkgname-$pkgver-dist
  install -d $pkgdir/usr/share/javascript/$pkgname
  cp -a ./{css,js,fonts} $pkgdir/usr/share/javascript/$pkgname/
}
