# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-zsh
pkgver=0.3.1
pkgrel=1
pkgdesc="An extension for colcon-core to provide zsh scripts."
arch=(any)
url="https://pypi.org/project/colcon-zsh"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d4/75/2e7ca5e0cff83cb3a9700a5323ed508edc4fbb93cd32c9566e28fb212e4c/colcon-zsh-$pkgver.tar.gz")
sha256sums=('2a4e69bb47bad5d20c7011b4619566a9c3e3837afa97f5e82217eb70211fd26d')


package() {
    cd ${srcdir}/colcon-zsh-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
