
pkgname=python-pygame-menu
pkgver=4.5.4
pkgrel=1
pkgdesc="Menu for pygame"
arch=('x86_64')
url="https://www.pygame.org/project/3165/7986"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pygame' )
source=("https://github.com/ppizarror/pygame-menu/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da7f48a4063e857ffd55e5b53b494223db63ce1791a39825e7791684ebcd01ce')

build() {
    cd pygame-menu-"$pkgver"
    python setup.py build
}

package() {
    cd pygame-menu-"$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
