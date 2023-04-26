# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.27.7
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
sha256sums_x86_64=('3dbc53c00039b44d558b6dcb4b0ed6b5bc488de8eb3b3e6255045cfbb4a07d31')


package() {
  cd "buildcache"

  mkdir -p "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
