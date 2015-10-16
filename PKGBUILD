# Maintainer: Sergey Marochkin <me@ziggi.org>
# Contributor: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
pkgname=dbschema
pkgver=7.1.0
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license='custom'
depends=('java-runtime')
install="dbschema.install"
source=("http://www.dbschema.com/DbSchema.zip"
        "dbschema"
        "dbschema.desktop"
        "dbschema.install")

package(){
  install -dm755 ${pkgdir}/opt
  cp -r DbSchema ${pkgdir}/opt/${pkgname}

  chmod 755 ${pkgdir}/opt/${pkgname}/DbSchema.sh

  install -Dm755 dbschema ${pkgdir}/usr/bin/dbschema
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

sha1sums=('a5145d0718c0b52e07bc42a40141c388b8f5e08a'
          '8b073fd8d750f92cd5012d9d13c374a978966e2f'
          'd609bda2b0ffd70b011a6b1f9ab51d62dd1f9ad4'
          '88c7c63c14dd278299e7d5c7d9e0e71e740a2e18')
