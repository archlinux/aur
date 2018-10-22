# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>

pkgname=python-prompt_toolkit-2
pkgver=2.0.6
pkgrel=1
pkgdesc="Library for building powerful interactive command line applications in Python"
url="https://github.com/jonathanslenders/python-prompt-toolkit"
arch=(any)
license=('BSD')
depends=('python' 'python-six>=1.9.0' 'python-wcwidth')
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/jonathanslenders/python-prompt-toolkit/archive/$pkgver.tar.gz)
provides=('python-prompt_toolkit-2')
conflicts=('python-prompt_toolkit')
md5sums=('03ec33c1678c37763b3c85c463c7e171')

package() {
    cd "$srcdir/python-prompt-toolkit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$_/LICENSE"
}
