# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=python-espeak-ng
pkgver=0.1.6
pkgrel=1
pkgdesc="Python interface for eSpeak NG"
arch=('any')
url="https://pypi.org/project/py-espeak-ng/"
license=('Apache')
depends=('python' 'espeak-ng')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c0/38/5f5d3fa612263ec5485e7405f2c19ab679c211853882778585399c692e57/py-espeak-ng-0.1.6.tar.gz")
sha256sums=('48ef63e265187c62f52647092adcfdd2a3e8b45943a457f7055218c474c0be82')

package() {
    cd "$srcdir/py-espeak-ng-$pkgver"
    python setup.py install --root "$pkgdir"
}
