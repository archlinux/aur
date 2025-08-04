# Maintainer: kartavkun <nikitarobezhko@yandex.ru>
pkgname=osufetch-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal terminal osu! profile viewer"
arch=('x86_64')
url="https://github.com/kartavkun/osufetch"
license=('MIT')
depends=('glibc')
provides=('osufetch')
conflicts=('osufetch')
source=("osufetch::${url}/releases/download/v${pkgver}/osufetch")
sha256sums=('9fd849ff2ba96a5df93d06488a8f94afec87a864c888d3083ffa325804c12560')

package() {
  install -Dm755 "$srcdir/osufetch" "$pkgdir/usr/bin/osufetch"
}
