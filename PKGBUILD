# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=hanguage
pkgver=1.0.4
pkgrel=1
pkgdesc="H language converter as defined by u/Huesosishe228"
arch=('any')
url="https://github.com/eshnd/Hanguage"
license=('MIT')
depends=('python')
source=("Hanguage-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0341a264451120e36a7d91d6b556ddd11082e94b241c47fe27f5b023053521b')
package() {
  cd "$srcdir/Hanguage-$pkgver"
  install -Dm755 hanguage.py "$pkgdir/usr/bin/hanguage"
}

