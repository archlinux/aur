# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=python-trakt-git
_srcname='PyTrakt'
pkgver=20161105
pkgrel=1
pkgdesc="API Python for trakt"
arch=('any')
url="https://github.com/moogar0880/${_srcname}"
license=('Apache 2.0')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')


package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -D LICENSE "$pkgdir/usr/share/licenses/python-trakt-git/LICENSE"
    
}


