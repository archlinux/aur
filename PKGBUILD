# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-parallel-executor
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to process packages in parallel."
arch=(any)
url="https://pypi.org/project/colcon-parallel-executor/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/1e/05/09c2e7d81400072c786c4facb7838e9a0eca4e0fb491878c587c3764c45b/colcon-parallel-executor-$pkgver.tar.gz")
sha256sums=('3ae0e0d6a78098f7c2cc5fc0fabd8757136842a156032b3d62fa69e72b01806b')


package() {
    cd ${srcdir}/colcon-parallel-executor-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
