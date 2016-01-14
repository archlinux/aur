# Maintainer: K1412 <jonathan@opensides.be>
pkgname=php-cas
pkgver=1.3.4
pkgrel=1
pkgdesc="CAS library for PHP"
arch=("any")
url="http://developer.jasig.org/cas-clients/php/"
license=("Apache")
depends=('php')

source=("http://developer.jasig.org/cas-clients/php/$pkgver/CAS-$pkgver.tgz")

md5sums=('58f93724ec52929658bb8f1be8fa2154')

package() {
  # Go in directory
  cd CAS-$pkgver/

  # Create directories
  install -d -m 0755 $pkgdir/usr/share/php/CAS/
  mkdir -p $pkgdir/usr/share/doc/$pkgname/

  # Copy files
  cp -a ./CAS/* $pkgdir/usr/share/php/CAS/
  cp -a ./CAS.php $pkgdir/usr/share/php/
  cp -a ./LICENSE  ./NOTICE  ./README.md  $pkgdir/usr/share/doc/$pkgname/
  cp -a ./docs/* $pkgdir/usr/share/doc/$pkgname/
}
