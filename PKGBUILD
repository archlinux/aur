# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.27.6
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('x86_64')
url="https://github.com/mbitsnbites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
optdepends=('lua')
provides=('buildcache')
conflicts=('buildcache')
source=("LICENSE::https://raw.githubusercontent.com/mbitsnbites/buildcache/master/LICENSE")
source_x86_64=("https://github.com/mbitsnbites/buildcache/releases/download/v$pkgver/buildcache-linux.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('2a97e2cf37491ee8dc168c12c47c0edd18435187381ba69f6f16e7cb88f12a23')


package() {
  cd "buildcache"

  mkdir -p "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
