# Maintainer: guilherme1628 <guilherme1628@users.noreply.github.com>
pkgname=ydrive-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A Yazi-inspired TUI file manager for Google Drive (precompiled)"
arch=('x86_64')
url="https://github.com/guilherme1628/ydrive"
license=('MIT')
depends=('gcc-libs')
provides=('ydrive')
conflicts=('ydrive')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ydrive-$pkgver-x86_64-linux.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/guilherme1628/ydrive/v$pkgver/LICENSE")
sha256sums=('8c203c08b7e0712e0f0ef731cb30535582321df8837e23fe6db92a2f7313f30d'
            'SKIP')

package() {
  install -Dm755 ydrive "$pkgdir/usr/bin/ydrive"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
