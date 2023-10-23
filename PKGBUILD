# Maintainer: KawaiDesu <mail@zeym.org>
pkgname=vikunja-frontend
pkgver=0.21.0
pkgrel=1
pkgdesc="The ToDo-app to organize your life - frontend static files"
arch=('any')
url="https://vikunja.io/"
license=('AGPL3')
options=(!strip)
source=("https://dl.vikunja.io/frontend/vikunja-frontend-${pkgver}.zip")

sha256sums=('ec59d8db8076123028331167357050f73bdb5b41793cf5c47d60acf9f1fddc12')

package(){
  find . -type f -not -name "vikunja-frontend-${pkgver}.zip" -exec install -vDm 0644 {} "${pkgdir}/usr/share/webapps/vikunja/"{} \;
}
