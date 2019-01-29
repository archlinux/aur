pkgname=jupyterthemes
pkgver=0.20.0
pkgrel=1
pkgdesc="Select and install a Jupyter notebook theme"
url="https://github.com/dunovank/jupyter-themes"
depends=('python' 'python-matplotlib' 'jupyter-notebook' 'python-lesscpy')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://github.com/dunovank/jupyter-themes/archive/v0.20.0.tar.gz')
md5sums=('52f5487f2bb03311a17becaae42a8e69')

build() {
    cd $srcdir/jupyter-themes-0.20.0
    python setup.py build
}

package() {
    cd $srcdir/jupyter-themes-0.20.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
