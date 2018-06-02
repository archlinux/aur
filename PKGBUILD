# Maintainer: Daniel Nunes <daniel.henri.nunes_AT_gmail_DOT_COM>

pkgname=python-fontawesome
pkgver=4.7.0.post5
pkgrel=1
pkgdesc="The Font Awesome icon set for python"
url="https://github.com/justbuchanan/fontawesome-python"
depends=('python' )
makedepends=('python3' 'python-setuptools' 'python-pypandoc')
license=('Apache')
arch=('any')
source=('https://files.pythonhosted.org/packages/6a/bc/7f9a20653fc63a4cdc00293268a1c3b0f391899a284415d723148901015f/fontawesome-4.7.0.post5.tar.gz')
md5sums=('d075aa456b4a72749ce1edfb136d7ef4')

build() {
    cd $srcdir/fontawesome-4.7.0.post5
    python setup.py build
}

package() {
    cd $srcdir/fontawesome-4.7.0.post5
    python setup.py install --root="$pkgdir" --optimize=1 
}
