# Maintainer: Lev Gorodetskii <aur@drsr.io>
pkgname=pacman-fix-permissions
_package=pacman_fix_permissions
pkgver=1.1.3
pkgrel=1
pkgdesc="Fix broken filesystem permissions"
arch=('any')
url="https://github.com/droserasprout/$pkgname"
license=('GPL3')
depends=('python' 'python-zstandard')
source=("https://github.com/droserasprout/$pkgname/releases/download/v$pkgver/$_package-$pkgver.tar.gz")
sha256sums=('0156f2730c3409afe1d4bb3473adc7bc8796888338dc1e58142d05e206c98b80')
makedepends=('python-pip')

package() {
  cd ${_package}-${pkgver}
  pip install . --root="${pkgdir}"
}

