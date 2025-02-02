# Maintainer: alzpmq <kodatemitsuru@outlook.com>
# Maintainer: Homalozoa <nx.tardis@gmail.com>
pkgname=python-colcon-hardware-acceleration
pkgver=0.8.0
pkgrel=1
pkgdesc="An extension for colcon-core to process packages in parallel."
arch=(any)
url="https://pypi.org/project/colcon-hardware-acceleration/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://github.com/colcon/colcon-hardware-acceleration/archive/refs/tags/0.8.0.tar.gz)
sha256sums=('3d6ad31b0418f4bcffd2f553be978c81295a942b78a5b9fc87a6d1bd5b58a74d')


package() {
    cd ${srcdir}/colcon-hardware-acceleration-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
