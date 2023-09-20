# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.28.7
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://gitlab.com/bits-n-bites/buildcache/-/raw/master/LICENSE")
source_x86_64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('71dc1f71a7022ee75f34388a61f1a7e3fc572831aa64add1e6a1634ce0b70f2d')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
