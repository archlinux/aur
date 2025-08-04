# Maintainer: kartavkun <nikitarobezhko@yandex.ru>
pkgname=osufetch-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal terminal osu! profile viewer"
arch=('x86_64')
url="https://github.com/kartavkun/osufetch"
license=('MIT')
depends=('glibc')
provides=('osufetch')
conflicts=('osufetch')
source=("osufetch::${url}/releases/download/v${pkgver}/osufetch")
sha256sums=('67385879404ec019ff02649ec242e5e0962ba5d51cfc39a0da7e8798624a8ac1')

package() {
  install -Dm755 "$srcdir/osufetch" "$pkgdir/usr/bin/osufetch"
}
