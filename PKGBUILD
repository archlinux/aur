# Maintainer: truemedian <truemedian at gmail dot com>
# Contributor: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvi-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(i686 x86_64)
url="https://github.com/luvit/luvi"
license=('Apache')
depends=('gcc-libs')
provides=(luvi)
conflicts=(luvi)
source_i686=("luvi-regular-$pkgver-i686::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-regular-Linux_i686")
source_x86_64=("luvi-regular-$pkgver-x86_64::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-regular-Linux_x86_64")
noextract=()
sha256sums_i686=('db4dfdf054799e1cab98634c0eead5b2befcb44f57ed65af288c16257f42af67')
sha256sums_x86_64=('f79614b208f7999030a13fca22ffeb91c3d880487be2b5b7e2425ab42ec7a1d0')

package() {
  cd "$srcdir"

  install -Dm755 "luvi-regular-$pkgver-$CARCH" "$pkgdir/usr/bin/luvi"
}
