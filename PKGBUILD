# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-test-result
pkgver=0.3.0
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the test results."
arch=(any)
url="https://pypi.org/project/colcon-test-result"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d7/fb/7c0977c84e732c493843c8461ed0dfa7733b72028d46b4848b0820029134/colcon-test-result-$pkgver.tar.gz")
sha256sums=('3861054b36ce3bc704af8b57e61c7b82d56a3fd9cb9031b751f44c51aeed097c')


package() {
    cd ${srcdir}/colcon-test-result-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
