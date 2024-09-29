# Maintainer: Michael Clayfield <asdf me asdf michaelclayfield asdf com asdf>
# Contributor: KawaiDesu <mail@zeym.org>
pkgname=vikunja-frontend
pkgver=0.24.4
pkgrel=1
pkgdesc="The ToDo-app to organize your life - frontend static files"
arch=('any')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
source=("https://dl.vikunja.io/frontend/vikunja-frontend-${pkgver}.zip")

sha256sums=('e6f7c014e92da9b41bc5b58a71bbddd8c7b1027fb78a8d70480c15b6bfb856ae')

package(){
  find . -type f -not -name "vikunja-frontend-${pkgver}.zip" -exec install -vDm 0644 {} "${pkgdir}/usr/share/webapps/vikunja/"{} \;
}
