# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=mun-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A programming language empowering creation through iteration - prebuilt binary"
arch=(x86_64)
url="https://mun-lang.org/"
license=(MIT)
provides=('mun')
conflicts=('mun' 'mun-git')
depends=('zlib' 'ncurses5-compat-libs' 'libffi6')
source=("https://github.com/mun-lang/mun/releases/download/v${pkgver}/mun-linux64-v${pkgver}.tar.gz")
md5sums=('ceb3343974affd918dd77965c0b7dd28')

package() {
  install -Dm755 "$srcdir/mun" "$pkgdir/usr/bin/mun"
}
