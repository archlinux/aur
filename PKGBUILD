# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('http-prompt')
pkgname=('http-prompt')
_module='http-prompt'
pkgver='0.5.0'
pkgrel=1
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python' 'python-click' 'httpie' 'python-prompt_toolkit' 'python-pygments' 'python-six' 'python-parsimonious' 'python-pip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/b9/bd/86db99851cb11aaee5d04cb4ea940d986ad8b1e62e49293a3fc932d7ebce/http-prompt-${pkgver}.tar.gz")
md5sums=('095a6c7b5c8780f13a32a6ad49ada063')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

