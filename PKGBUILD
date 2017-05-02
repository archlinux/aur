# Maintainer: Alex Smith <azphreal19@protonmail.com>
_name=zgitignore
pkgname=python-${_name}
pkgver=0.7
pkgrel=1
pkgdesc="Check if a file is ignored by a .zgitignore file, compatible with .gitignore syntax"
arch=('any')
url="https://github.com/zb3/zgitignore"
license=('MIT')
#makedepends=
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=("SKIP")

package() {
    cd "${_name}-${pkgver}"
    python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
