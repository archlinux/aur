# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=hanguage
pkgver=1.0.1
pkgrel=1
pkgdesc="H language converter as defined by u/Huesosishe228"
arch=('any')
url="https://github.com/eshnd/Hanguage"
license=('MIT')
depends=('python')
source=("Hanguage-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41892c0f4e96856692996a8b9111956de289683840f2955072b95300d06d02fe')
package() {
  cd "$srcdir/Hanguage-$pkgver"
  install -Dm755 hanguage.py "$pkgdir/usr/bin/hanguage"
}

