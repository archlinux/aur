# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.4.2
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0db4a949a07f48ab4dacad275e42e23ff64d04f2994153bfd5e8a5d31a94b7b1')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
