# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A typing application (prebuilt binary)"
arch=('x86_64')
url="https://git.safallama.com.np/safalski/typeShi"
license=('BSD-2-Clause')
provides=('typeshi')
conflicts=('typeshi')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
source=("$pkgname-$pkgver.tar.gz::https://git.safallama.com.np/safalski/typeShi/releases/download/v$pkgver/typeshi-bin-$pkgver-x86_64.tar.gz")
sha256sums=('9d6b7b6ee7f1b4e6483d2a5ac555d978d22b5e4b242b25902938ba647fe65e81')
package() {
  install -Dm755 usr/bin/typeshi "$pkgdir/usr/bin/typeshi"
  install -Dm644 usr/share/applications/typeshi.desktop "$pkgdir/usr/share/applications/typeshi.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/typeshi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/typeshi.svg"
}
