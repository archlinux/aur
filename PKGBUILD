# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-frontend
pkgver=0.24.1
pkgrel=1
pkgdesc="The ToDo-app to organize your life - frontend static files"
arch=('any')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
source=("https://dl.vikunja.io/frontend/vikunja-frontend-${pkgver}.zip")

sha256sums=('2278ba1d7f50bf656a771378a7a47434730496fe1867d4d4964020a2e7a713ff')

package(){
  find . -type f -not -name "vikunja-frontend-${pkgver}.zip" -exec install -vDm 0644 {} "${pkgdir}/usr/share/webapps/vikunja/"{} \;
}
