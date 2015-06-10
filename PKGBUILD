# Maintainer: Joerg Thalhiem <joerg@higgsboson.tk>

pkgname=jabber-migrate
pkgver=0.1
pkgrel=1
pkgdesc="Migrate roster from one jabber server to another"
arch=('any')
url="https://github.com/spiculator/jabber-migrate"
license=('MIT')
depends=('perl-net-jabber')
source=("https://github.com/spiculator/jabber-migrate/archive/v0.1.tar.gz")

package() {
  cd ${srcdir}/jabber-migrate-$pkgver
  install -D -m755 jabber-migrate $pkgdir/usr/bin/jabber-migrate
}
md5sums=('e204690a11eef589f5c00ee64dd0191c')
