# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=todoist-full-offline-backup
pkgver=0.1
pkgrel=1
pkgdesc="Small, dependency-less Python script to make a backup of all Todoist tasks and attachments that is accessible offline"
arch=('any')
url="https://github.com/joanbm/todoist-full-offline-backup"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-setuptools')
provides=('todoist-full-offline-backup')
conflicts=('todoist-full-offline-backup')
options=(!emptydirs)
source=(https://github.com/joanbm/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('63b90c080c42b23077392f59d19ad8cff9350e814926b3ec3939978b22dfb282')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
