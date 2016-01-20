# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname=tbsm
pkgver=0.1
pkgrel=1
pkgdesc="A pure bash session or application launcher. Inspirded by cdm, tdm and krunner."
arch=('any')
url="https://github.com/loh-tar/tbsm"
license=("GPL")
depends=("bash")
backup=("etc/xdg/$pkgname/$pkgname.conf")
install="$pkgname.install"
source=("https://github.com/loh-tar/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('52508a3dd0358d7dbafc21f4ad4f72ed')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
