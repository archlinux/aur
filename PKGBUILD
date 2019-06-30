# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=0.1.4
pkgrel=1
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
_realname=Flask-Themes2
source=("https://files.pythonhosted.org/packages/d6/20/506bce9a04e9d6d48d84d64a7b40f5769db6a32b6cfc1b7cb9f42fbdf099/Flask-Themes2-$pkgver.tar.gz")

build() {
	cd $srcdir/${_realname}-$pkgver
	python setup.py build
}

package() {
	cd ${srcdir}/${_realname}-$pkgver
	python setup.py install --root=$pkgdir
}

md5sums=('7cbc8e0017625ce5ef70b9e54bcbd866')
