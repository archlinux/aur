#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-defaults
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide custom default values for the command line arguments from a configuration file."
arch=(any)
url="https://pypi.org/project/colcon-defaults/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/11/89/a62d304e1d3eb926af72481ed5152bf85c0c933c11e08b3773ea974a5fa8/colcon-defaults-0.2.2.tar.gz)
sha256sums=('ba6a2921aeb1d4b3b543d8ef7d4f7f61f64be8c9abd0fa21fb94696f6a6fb483')


package() {
    cd ${srcdir}/colcon-defaults-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
