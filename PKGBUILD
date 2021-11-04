# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname="python-west"
_name=${pkgname##"python-"}
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=0.11.1
pkgrel=2
arch=("any")
url="https://pypi.org/project/west/"
license=("Apache")
depends=("python>=3.6"
         "python-colorama"
         "python-pyaml>=5.1"
         "python-pykwalify")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=("30771f3ec2a4281cd05c277a90f7dc94ded97d6dc1e1decdf4fe452dbbacc283")
