# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=pueue-git
pkgver=0.3.4
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python')
url='https://github.com/nukesor/pueue'
source=("https://github.com/Nukesor/Pueue/archive/${pkgver}.tar.gz")
sha256sums=('38e20a29b33efc72ad87e77307d34d141a9c8023da0d3b27ff5c8eb20827e40b')

package() {
  cd "${srcdir}/$pgkname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
}
