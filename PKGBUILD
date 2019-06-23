# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-bash
pkgver=0.3.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide Bash scripts."
arch=(any)
url="https://pypi.org/project/colcon-bash"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/68/87/8d2c2442fe5aec0af3aff168335ad38ed3546bbd247c1d33cd0c5375eebf/colcon-bash-0.3.2.tar.gz)
sha256sums=('6494a5e20392234f115547eac772546404a22e333813377b5dd6143bb2379772')


package() {
    cd ${srcdir}/colcon-bash-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
