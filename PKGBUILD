# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tbsm'
pkgver='0.4'
pkgrel='1'
pkgdesc='A pure bash session or application launcher. Inspired by cdm, tdm and krunner.'
arch=('any')
url='https://github.com/loh-tar/tbsm'
license=('GPL')
depends=('bash')
backup=("etc/xdg/$pkgname/$pkgname.conf")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('52d85d66a8ab5429f812591789a5d4a6')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
