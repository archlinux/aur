# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=csslint
pkgver=1.0.5
pkgrel=1
pkgdesc="Automated linting of Cascading Stylesheets"
arch=('any')
url="https://github.com/stubbornella/csslint"
license=('GPL')
depends=('nodejs')
makedepends=('npm')
conflicts=('csslint-git')

pkgver()
{
  npm view $pkgname version
}
package() {
  npm install $pkgname -g --prefix ${pkgdir}/usr
  rmdir ${pkgdir}/usr/etc
  chown -R root:root ${pkgdir}/usr
}

# vim:set ts=2 sw=2 et:
