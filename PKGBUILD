# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=hanguage
pkgver=1.0.3
pkgrel=1
pkgdesc="H language converter as defined by u/Huesosishe228"
arch=('any')
url="https://github.com/eshnd/Hanguage"
license=('MIT')
depends=('python')
source=("Hanguage-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6fb341167cc9a11b04d65d47a2a115e8fb8de15b528ef06b235e943990be4713')
package() {
  cd "$srcdir/Hanguage-$pkgver"
  install -Dm755 hanguage.py "$pkgdir/usr/bin/hanguage"
}

