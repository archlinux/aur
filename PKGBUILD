# Maintainer: loafer <davemorgan353 at btinternet dot com>

pkgname=diradm
pkgver=1.3
pkgrel=1
pkgdesc="A simple bash script for managing posix users and groups stored in a LDAP directory"
arch=('i686' 'x86_64')
url="http://www.hits.at/diradm/"
license=('GPL')
depends=('openldap')
source=(http://www.hits.at/"$pkgname/$pkgname-$pkgver".tar.gz)
md5sums=('a63bdc87694e57626721f1b602ef8872')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 diradm "$pkgdir"/usr/bin/"$pkgname"
  install -D -m644 diradm.conf "$pkgdir"/etc/diradm.conf
}
