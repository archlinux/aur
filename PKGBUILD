# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python-flask' 'python-simplejson')
makedepends=('python-setuptools')
_realname=Flask-Themes2
source=("https://files.pythonhosted.org/packages/8a/f8/9bdefea5451745fcd102e42e4b565691f99afb88d542e7fc710536422d6b/${_realname}-$pkgver.tar.gz")

build() {
    cd "$srcdir/${_realname}-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/${_realname}-$pkgver"
    python setup.py install --root="$pkgdir"
}

md5sums=('f8aac4b4464712f8567d036a31624fd7')
