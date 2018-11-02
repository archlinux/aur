# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-recursive-crawl
pkgver=0.2.0
pkgrel=1
pkgdesc="An extension for colcon-core to recursively crawl for packages."
arch=(any)
url="https://pypi.org/project/colcon-recursive-crawl"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c3/f8/93df7ed8fb24c59b1550fdc19f13284b0a89ae01703f45ce516c0a3717dd/colcon-recursive-crawl-$pkgver.tar.gz")
sha256sums=('dc955c2ec55c5ef26fada9f456aa31afd2392fb76e3f19fcca0878a318c947bc')


package() {
    cd ${srcdir}/colcon-recursive-crawl-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
