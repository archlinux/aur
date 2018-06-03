# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=todoist-full-offline-backup
pkgver=0.3
pkgrel=2
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/todoist-full-offline-backup"
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('3b00b4d8d13b1a01338f750dab0d73f69f0b807a2427732a03367169e61c864b')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
