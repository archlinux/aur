# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('http-prompt')
pkgname=('http-prompt')
_module='http-prompt'
pkgver='0.2.0'
pkgrel=1
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python' 'python-click' 'httpie' 'python-prompt_toolkit' 'python-pygments' 'python-six' 'python-parsimonious' 'python-pip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/9f/5f/344abbe7eea45e8116f1c7b975f6e8e7aeb8959f637d41347259703149e0/http-prompt-${pkgver}.tar.gz")
md5sums=('3d5b1418188be4814fc3488309fbe065')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

