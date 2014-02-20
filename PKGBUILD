# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=baikal
pkgver=0.2.7
pkgrel=1
pkgdesc="Lightweight CalDAV+CardDAV server"
url="http://baikal-server.com/"
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database')
source=("http://baikal-server.com/get/baikal-regular-${pkgver}.tgz")
sha1sums=('01eabcf0229ddffc0542f4e2a349754e778abbea')
options=('!strip')

package() {
  cd "${srcdir}/baikal-regular"
  mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
  cp -R * "$pkgdir/usr/share/webapps/$pkgname"
  chown -R http:http "$pkgdir/usr/share/webapps/$pkgname"
}

# vim:set ts=2 sw=2 et:
