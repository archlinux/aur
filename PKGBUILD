# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('x86_64')
url="https://github.com/mbitsnbites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://raw.githubusercontent.com/mbitsnbites/buildcache/master/LICENSE")
source_x86_64=("https://github.com/mbitsnbites/buildcache/releases/download/v$pkgver/buildcache-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('3e7aef186e35a492b2866506a9b87df8c3ad02e81a77fd5483de45694f598fa6')


package() {
  cd "buildcache"

  mkdir -p "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
