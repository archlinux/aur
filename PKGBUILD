# Maintainer: Homalozoa <nx.tardis@gmail.com>
pkgname=python-colcon-hardware-acceleration
pkgver=0.7.0
pkgrel=1
pkgdesc="An extension for colcon-core to process packages in parallel."
arch=(any)
url="https://pypi.org/project/colcon-hardware-acceleration/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/af/ee/277b336150a66e56a52555dee939d92a05ff24a0867b26599cfc4d053e65/colcon-hardware-acceleration-0.7.0.tar.gz)
sha256sums=('83ec8e00c9e54b8678f429bba71d20700f519f203397ba1de9fa8d9ed5e65059')


package() {
    cd ${srcdir}/colcon-hardware-acceleration-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}