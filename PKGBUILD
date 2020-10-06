# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=full-offline-backup-for-todoist
pkgver=0.4.1
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/full-offline-backup-for-todoist"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f131496f9de369ab05cfafcb45393a78bb1bb0b7d063e563f0c42eb74e2812ce')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
