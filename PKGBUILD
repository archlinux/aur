pkgbase=('python-git-reviewers')
pkgname=('python-git-reviewers')
_module='git-reviewers'
pkgver='0.6.1'
pkgrel=1
pkgdesc="Suggest reviewers for your git branch"
url="https://github.com/albertyw/git-reviewers"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/git-reviewers/git-reviewers-${pkgver}.tar.gz")
md5sums=('67bf13f54e5d7d24e86cf4a5d11ae885')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
