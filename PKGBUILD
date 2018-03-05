# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=freshrss
pkgver=1.10.1
pkgrel=1
pkgdesc='A free, self-hostable aggregator…'
arch=('any')
url='http://freshrss.org/'
license=('AGPL')
depends=('php')
optdepends=('apache: Web server to run FreshRSS'
            'nginx: Web server to run FreshRSS'
            'cherokee: Web server to run FreshRSS'
            'mysql: Database server to run FreshRSS'
            'postgresql: Database server to run FreshRSS'
            'sqlite: Database server to run FreshRSS')
install="$pkgname.install"
source=("https://github.com/FreshRSS/FreshRSS/archive/$pkgver.tar.gz")
sha256sums=('76737974c9ea670aef5a089a3716d40a83e8896571aaac906b615c28d420af83')

package() {
  cd "${srcdir}/FreshRSS-$pkgver"
  install -d "$pkgdir/usr/share/webapps/freshrss"
  cp -r . "$pkgdir/usr/share/webapps/freshrss/"
}

# vim:set ts=2 sw=2 et:
