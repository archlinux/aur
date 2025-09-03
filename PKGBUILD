# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=hanguage
pkgver=1.0.0
pkgrel=1
pkgdesc="H language converter as defined by u/Huesosishe228"
arch=('any')
url="https://github.com/eshnd/hanguage"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef4b6696742e5593f331b4ab8cb5d467d0e7b033d22b22c6e3f1f0a4130a3b04')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 hanguage.py "$pkgdir/usr/bin/hanguage"
}

