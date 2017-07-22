# Maintainer: Renato Candido <renatocan@gmail.com>

pkgname=jupyterthemes
pkgver=0.17.3
pkgrel=1
pkgdesc="Select and install a Jupyter notebook theme"
url="https://github.com/dunovank/jupyter-themes"
depends=('python' 'python-matplotlib' 'jupyter-notebook' 'python-lesscpy')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/99/c6/0c5e58bdc3a3f1042e88bb35435e04d346c862745ec2ffe2004bd030ebb3/jupyterthemes-0.17.3.tar.gz')
md5sums=('01cbc565f6b2170afd1a5151b57274b8')

build() {
    cd $srcdir/jupyterthemes-0.17.3
    python setup.py build
}

package() {
    cd $srcdir/jupyterthemes-0.17.3
    python setup.py install --root="$pkgdir" --optimize=1 
}

md5sums=('01cbc565f6b2170afd1a5151b57274b8')
