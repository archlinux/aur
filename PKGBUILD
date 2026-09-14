# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="A typing application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
provides=('typeshi')
conflicts=('typeshi')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/releases/download/v$pkgver/typeshi-bin-$pkgver-x86_64.tar.gz")
sha256sums=('da7a2d6f62ab6bc60950eafc75acf934de84719a5d646bc26ea7205098109d19')
package() {
  install -Dm755 usr/bin/typeshi "$pkgdir/usr/bin/typeshi"
  install -Dm644 usr/share/applications/typeshi.desktop "$pkgdir/usr/share/applications/typeshi.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/typeshi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/typeshi.svg"
}
