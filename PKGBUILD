# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.3.2
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('17b2151a278382044de5ddcae3c6e41874395b361c484180564b826e4e18caf9')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
