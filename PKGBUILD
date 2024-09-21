# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-frontend
pkgver=0.24.3
pkgrel=1
pkgdesc="The ToDo-app to organize your life - frontend static files"
arch=('any')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
source=("https://dl.vikunja.io/frontend/vikunja-frontend-${pkgver}.zip")

sha256sums=('c6d8fcf102ea2c4a2f742b8cfc6eb9e089422c538ceb5f6fa9f290beb3b3f930')

package(){
  find . -type f -not -name "vikunja-frontend-${pkgver}.zip" -exec install -vDm 0644 {} "${pkgdir}/usr/share/webapps/vikunja/"{} \;
}
