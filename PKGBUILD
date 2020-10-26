# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-recursive-crawl
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to recursively crawl for packages."
arch=(any)
url="https://pypi.org/project/colcon-recursive-crawl"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c3/9e/bc1935dc532af90b802ed16cf0a1f5f858275e49d775895fca5161fc9910/colcon-recursive-crawl-$pkgver.tar.gz")
sha256sums=('80a11b3a203960aff4187e9b562930ffe4bb54c061178ae1daedbf06b6da1b96')


package() {
    cd ${srcdir}/colcon-recursive-crawl-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
