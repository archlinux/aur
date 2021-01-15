# Maintainer: Lev Gorodetskiy <aur@droserasprout.space>
pkgname=pacman-fix-permissions
pkgver=1.1.1
pkgrel=1
pkgdesc="Fix broken filesystem permissions"
arch=('any')
url="https://github.com/droserasprout/${pkgname}"
license=('GPL3')
depends=('python' 'python-zstandard')
source=("https://github.com/droserasprout/pacman-fix-permissions/releases/download/v$pkgver/pacman-fix-permissions-$pkgver.tar.gz")
sha256sums=('2a3eae130ab1450e6313696915114d315400cd6fd276b0c772626112d568f64b')
makedepends=('python-setuptools')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

