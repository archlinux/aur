pkgname=mun-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A programming language empowering creation through iteration - prebuilt binary"
arch=(x86_64)
url="https://mun-lang.org/"
license=(MIT)
provides=('mun')
conflicts=('mun' 'mun-git')
depends=('zlib' 'ncurses5-compat-libs' 'libffi6' 'libffi7')
source=("https://github.com/mun-lang/mun/releases/download/v${pkgver}/mun-linux64-v${pkgver}.tar.gz")
md5sums=('c924ae5ee8905a742fb0dc356035bbab')

package() {
  install -Dm755 "$srcdir/mun" "$pkgdir/usr/bin/mun"
}
