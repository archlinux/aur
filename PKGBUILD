# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A typing application (prebuilt binary)"
arch=('x86_64')
url="https://git.safallama.com.np/safalski/typeShi"
license=('BSD-2-Clause')
provides=('typeshi')
conflicts=('typeshi')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools')
source=("$pkgname-$pkgver.tar.gz::https://git.safallama.com.np/safalski/typeShi/releases/download/v$pkgver/typeshi-bin-$pkgver-x86_64.tar.gz")
sha256sums=('6c8925f43aa94a9253ff59d80e3278d22b9f02e043c1dce2add02ac4337f1b9b')

package() {
  install -Dm755 usr/bin/typeshi "$pkgdir/usr/bin/typeshi"
  install -Dm644 usr/share/applications/typeshi.desktop "$pkgdir/usr/share/applications/typeshi.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/typeshi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/typeshi.svg"
}
