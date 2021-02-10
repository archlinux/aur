# Maintainer: Lev Gorodetskiy <aur@droserasprout.space>
pkgname=pacman-fix-permissions
pkgver=1.1.2
pkgrel=1
pkgdesc="Fix broken filesystem permissions"
arch=('any')
url="https://github.com/droserasprout/${pkgname}"
license=('GPL3')
depends=('python' 'python-zstandard')
source=("https://github.com/droserasprout/pacman-fix-permissions/releases/download/v$pkgver/pacman-fix-permissions-$pkgver.tar.gz")
sha256sums=('bb698ea57c48b5285b516c96ecde49ab84d3ffd188a5c5d303a7159c24d7e636')
makedepends=('python-setuptools')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

