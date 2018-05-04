# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=todoist-full-offline-backup
pkgver=0.2
pkgrel=2
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/todoist-full-offline-backup"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('python-setuptools')
source=(https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6e583fc75554bdf6ec814f54589c84de074828ea437ffd0ea60d4a6dc6220d44')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
