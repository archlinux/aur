# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://gitlab.com/bits-n-bites/buildcache/-/raw/master/LICENSE")
source_x86_64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('bbe55b61ba8d8ab59823f89f00891f9e73812d6c8f8fbaa3e09d513f9d48af8e')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
