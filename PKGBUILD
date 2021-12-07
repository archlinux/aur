
pkgname=python-pygame-menu
pkgver=4.2.0
pkgrel=1
pkgdesc="Menu for pygame"
arch=('x86_64')
url="https://www.pygame.org/project/3165/7986"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pygame' )
source=("https://github.com/ppizarror/pygame-menu/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('215868e4753c48dc7b49ab54fff75fbb2827e86947e175006eac1588acdd837d')

build() {
    cd pygame-menu-"$pkgver"
    python setup.py build
}

package() {
    cd pygame-menu-"$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
