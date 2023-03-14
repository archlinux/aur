# Maintainer: Deltara <boided420 at gmail dot com>
pkgname=mun-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A programming language empowering creation through iteration - prebuilt binary"
arch=(x86_64)
url="https://mun-lang.org/"
license=(MIT)
provides=('mun')
conflicts=('mun' 'mun-git')
depends=('zlib' 'ncurses5-compat-libs' 'libffi6' 'libffi7')
source=("https://github.com/mun-lang/mun/releases/download/v${pkgver}/mun-linux-x86_64-${pkgver}.tar.xz")
md5sums=('137933b8c9922b7f02e7a5c22574baf1')

package() {
  install -Dm755 "$srcdir/mun" "$pkgdir/usr/bin/mun"
}
