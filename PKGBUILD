# FOR otaripper-bin/PKGBUILD
pkgname=otaripper-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Ultra-fast partition extractor for Android OTA files (binary)"
arch=('x86_64')
url="https://github.com/syedinsaf/otaripper"
license=('Apache-2.0')
provides=('otaripper')
conflicts=('otaripper' 'otaripper-git')
source=("otaripper-$pkgver-linux-static-x86_64.tar.gz::$url/releases/download/v$pkgver/otaripper-$pkgver-linux-static-x86_64.tar.gz")
sha256sums=('e4d9c669145903b41d06e232938a4b67584f275e771487878787878787878787')
package() {
  install -Dm755 otaripper "$pkgdir/usr/bin/otaripper"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/otaripper/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/otaripper/README.md"
}