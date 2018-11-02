# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-bash
pkgver=0.3.1
pkgrel=1
pkgdesc="An extension for colcon-core to provide Bash scripts."
arch=(any)
url="https://pypi.org/project/colcon-bash"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/08/48/48bf12b657b68bc8eeee64245a15d331cb6d204c9855f9bdb21c48517df3/colcon-bash-$pkgver.tar.gz")
sha256sums=('980cdda566cf8722cdb6bf264ebef1036a8cebbf42f36a58b4495de2984948eb')


package() {
    cd ${srcdir}/colcon-bash-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
