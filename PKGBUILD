# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.3.3
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('395d63d5d5d394b0012e6d065fc3709380eb6dbb125936a066812f501066a333')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
