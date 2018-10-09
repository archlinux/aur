# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>

pkgname=python-prompt_toolkit-2
pkgver=2.0.5
pkgrel=1
pkgdesc="Library for building powerful interactive command line applications in Python"
url="https://github.com/jonathanslenders/python-prompt-toolkit"
arch=(any)
license=('BSD')
depends=('python' 'python-six>=1.9.0' 'python-wcwidth')
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/jonathanslenders/python-prompt-toolkit/archive/$pkgver.tar.gz)
provides=('python-prompt_toolkit')
conflicts=('python-prompt_toolkit')
md5sums=('162202d940109a2425ea7746b33c7cd4')

package() {
    cd "$srcdir/python-prompt-toolkit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$_/LICENSE"
}
