
pkgname=python-pygame-menu
pkgver=4.2.8
pkgrel=1
pkgdesc="Menu for pygame"
arch=('x86_64')
url="https://www.pygame.org/project/3165/7986"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pygame' )
source=("https://github.com/ppizarror/pygame-menu/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c422fe4420cf12388a1835aefe89114796562963d1de6d7aa88f68880a2d0311')

build() {
    cd pygame-menu-"$pkgver"
    python setup.py build
}

package() {
    cd pygame-menu-"$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
