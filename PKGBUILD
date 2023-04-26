# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.28.0
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
sha256sums_x86_64=('70c1244e0017bd78ee29c36903ac00e1dd1501f1136e07bbd0284995664ffdb6')


package() {
  cd "buildcache"

  mkdir -p "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
