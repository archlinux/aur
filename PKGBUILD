# Maintainer: kartavkun <nikitarobezhko@yandex.ru>
pkgname=osufetch-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal terminal osu! profile viewer"
arch=('x86_64')
url="https://github.com/kartavkun/osufetch"
license=('GPL-3.0')
depends=('glibc')
provides=('osufetch')
conflicts=('osufetch')
source=("osufetch::${url}/releases/download/v${pkgver}/osufetch")
sha256sums=('6633348af522d76d332e57c6400ba62ad512c7ffc9fa63bbd137026cda8d69fc')

package() {
  install -Dm755 "$srcdir/osufetch" "$pkgdir/usr/bin/osufetch"
}
