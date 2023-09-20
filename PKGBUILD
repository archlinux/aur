# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.28.5
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
source_x86_64=("https://gitlab.com/api/v4/projects/49153623/packages/generic/releases/v$pkgver/buildcache-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('33eda8bfcc5e3eb9faf3dc0b4311539c61754f9e1dd8c7447cf46457b4fd4749')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
