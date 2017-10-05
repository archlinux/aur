# Maintainer: RcrdBrt <riccardobrt@gmail.com>
# Prev maintainer: ser

_pkgname=flask-paginate
pkgname=python-flask-paginate
pkgver=0.5.1
pkgrel=1
pkgdesc="flask-paginate is a simple paginate extension for flask which is reference to will_paginate, and use bootstrap as css framework."
arch=('any')
url="http://github.com/lixxu/flask-paginate"
license=('BSD-3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/fc/95/d7d61640893050a55365ffba33885883495c0838a05f11984336aa023f00/flask-paginate-0.5.1.tar.gz#md5=83bdaa64c75df75296abb5a4f7edfa14")
md5sums=('83bdaa64c75df75296abb5a4f7edfa14')

package() {
depends=('python-flask')

    cd $_pkgname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

}

