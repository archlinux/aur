# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-frontend
pkgver=0.24.6
pkgrel=1
pkgdesc="The ToDo-app to organize your life - frontend static files"
arch=('any')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
source=("https://dl.vikunja.io/frontend/vikunja-frontend-${pkgver}.zip")

sha256sums=('ba2bbea8d81d2ae5ddb1c5dce9116f1c4a9bbdb210855eaa6385224096f51099')

package(){
  find . -type f -not -name "vikunja-frontend-${pkgver}.zip" -exec install -vDm 0644 {} "${pkgdir}/usr/share/webapps/vikunja/"{} \;
}
