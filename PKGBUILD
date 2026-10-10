# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi-bin
_pkgname=typeshi
pkgver=0.1.18
pkgrel=1
pkgdesc="A typing application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/releases/download/v$pkgver/typeshi-bin-$pkgver-x86_64.tar.gz")
sha256sums=('ce7cff571b66adb8b1b26856c210fd9368aa8b5558cfbca1621297318175f73e')

package() {
  install -Dm755 usr/bin/typeshi "$pkgdir/usr/bin/typeshi"
  install -Dm644 usr/share/applications/typeshi.desktop "$pkgdir/usr/share/applications/typeshi.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/typeshi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/typeshi.svg"
}
