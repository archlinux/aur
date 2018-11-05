#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-powershell
pkgver=0.3.3
pkgrel=1
pkgdesc="An extension for colcon-core to provide PowerShell scripts."
arch=(any)
url="https://pypi.org/project/colcon-powershell/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c8/7a/26612eb3a1b1dcd1ca69177c74d172dac7563f1c392f2067f6a2e148046a/colcon-powershell-$pkgver.tar.gz")
sha256sums=('1f29d974119e14a07b4d82a1085d6dc446c1c8dbaf7feb594f39b70f3e4cbc9b')


package() {
    cd ${srcdir}/colcon-powershell-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
