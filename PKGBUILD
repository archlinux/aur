# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('http-prompt')
pkgname=('http-prompt')
_module='http-prompt'
pkgver='0.3.1'
pkgrel=1
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python' 'python-click' 'httpie' 'python-prompt_toolkit' 'python-pygments' 'python-six' 'python-parsimonious' 'python-pip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/4b/72/4bbf0a9783f86a4daa818580d33b25f18b63536aa6011093da2c4c070621/http-prompt-${pkgver}.tar.gz")
md5sums=('f4e750e3a41c99a58335c8315a992900')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

