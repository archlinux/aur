# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=0.1.5
pkgrel=2
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python-flask' 'python-simplejson')
makedepends=('python-setuptools')
_realname=Flask-Themes2
source=("https://files.pythonhosted.org/packages/fa/3f/c9615626ce769bb462b00b1a8c8398d383437cdd2a352c99d3993aaca002/${_realname}-$pkgver.tar.gz")

build() {
    cd "$srcdir/${_realname}-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/${_realname}-$pkgver"
    python setup.py install --root="$pkgdir"
}

md5sums=('38d728671701c44386881123396d6303')
