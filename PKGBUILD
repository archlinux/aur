# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('http-prompt')
pkgname=('http-prompt')
_module='http-prompt'
pkgver='0.4.1'
pkgrel=1
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python' 'python-click' 'httpie' 'python-prompt_toolkit' 'python-pygments' 'python-six' 'python-parsimonious' 'python-pip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/85/aa/21e335ccf8184d64d43ec6e1c9f029485b0740307a27a08059b58d5e68e6/http-prompt-${pkgver}.tar.gz")
md5sums=('b36d22209d2260aa1071c860e4e03c7c')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

