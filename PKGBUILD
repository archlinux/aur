# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvi-bin
pkgver=2.7.6
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(i686 x86_64)
url="https://github.com/luvit/luvi"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=(luvi)
conflicts=(luvi)
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("luvi-regular-$pkgver-i686::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-regular-Linux_i686")
source_x86_64=("luvi-regular-$pkgver-x86_64::https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-regular-Linux_x86_64")
noextract=()
md5sums_i686=('916a676dff1235976b1d0cd0aa33d497')
md5sums_x86_64=('009d71ec899312f719ac63f2a27b4ffd')

package() {
  cd "$srcdir"

  install -Dm755 "luvi-regular-$pkgver-$CARCH" "$pkgdir/usr/bin/luvi"
}
