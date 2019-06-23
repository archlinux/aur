# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-zsh
pkgver=0.3.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide zsh scripts."
arch=(any)
url="https://pypi.org/project/colcon-zsh"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/52/98/3bd10dbfec6410f4bccd1fd20d6d8fff14e877024c87e075477a4a7bf2e7/colcon-zsh-0.3.2.tar.gz)
sha256sums=('4b108e81913da4ff408de788633de5868b9dfb2a577a67997e50b3ccfed1ff54')


package() {
    cd ${srcdir}/colcon-zsh-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
