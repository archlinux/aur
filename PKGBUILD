# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=1.0.1
pkgrel=1
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python-flask' 'python-simplejson')
makedepends=('python-setuptools')
_realname=Flask-Themes2
source=("https://files.pythonhosted.org/packages/a9/51/5cbc31456eb182d507476331c66ddf866eea412baa2ea527991bd008c2eb/Flask-Themes2-${pkgver}.tar.gz")

build() {
  cd "$srcdir/${_realname}-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${_realname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

sha256sums=('82c3204105e38437d04619bb1f4901cbc8cac5def9598f8f84747a464fcf50fb')
