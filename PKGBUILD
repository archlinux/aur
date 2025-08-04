# Maintainer: kartavkun <nikitarobezhko@yandex.ru>
pkgname=osufetch-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal terminal osu! profile viewer"
arch=('x86_64')
url="https://github.com/kartavkun/osufetch"
license=('GPL-3.0')
depends=('glibc')
provides=('osufetch')
conflicts=('osufetch')
source=("osufetch::${url}/releases/download/v${pkgver}/osufetch")
sha256sums=('0f7e2c6680259370f04838c552db6f9b2c96b8c8157a4613a947395e1cd5cf22')

package() {
  install -Dm755 "$srcdir/osufetch" "$pkgdir/usr/bin/osufetch"
}
