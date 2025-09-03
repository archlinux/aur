# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=hanguage
pkgver=1.0.2
pkgrel=1
pkgdesc="H language converter as defined by u/Huesosishe228"
arch=('any')
url="https://github.com/eshnd/Hanguage"
license=('MIT')
depends=('python')
source=("Hanguage-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ff8af492332c64c3b60bbbb07324ee88d678462d1dd67654c54c74337b6fa6b')
package() {
  cd "$srcdir/Hanguage-$pkgver"
  install -Dm755 hanguage.py "$pkgdir/usr/bin/hanguage"
}

