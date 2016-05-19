# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('http-prompt')
pkgname=('http-prompt')
_module='http-prompt'
pkgver='0.1.1'
pkgrel=1
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python' 'python-click' 'httpie' 'python-prompt_toolkit' 'python-pygments' 'python-six' 'python-parsimonious' 'python-pip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/2c/67/8ba4088f8f45cd1d431a11149480f7780207692c82e013a518e388d36590/http-prompt-${pkgver}.tar.gz")
md5sums=('f84290db4dde3de7f8d47ee4fa9431bf')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

