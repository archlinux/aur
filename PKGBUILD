# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=csslint
pkgver=0.10.0
pkgrel=1
pkgdesc="Automated linting of Cascading Stylesheets"
arch=('any')
url="https://github.com/stubbornella/csslint"
license=('GPL')
depends=('nodejs')
conflicts=('csslint-git')
package() {
  npm install csslint -g --prefix ${pkgdir}/usr
}

# vim:set ts=2 sw=2 et:
