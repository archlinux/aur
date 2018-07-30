# Maintainer: Chn Tondovsko <chn566@gmail.com>
# Contributor: Bigrush <Tom.harpaz98@gmail.com>

pkgname=nama
pkgver=2.0.1
pkgrel=1
pkgdesc="This tool uses nmcli to easily set static ip addresses"
arch=('any')
url="https://github.com/chn555/nama"
license=('GPLv3')
depends=('bash')
source=("https://github.com/chn555/nama/archive/2.0.0.tar.gz")

md5sums=('SKIP')


package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/nama/LICENSE.md"
}
