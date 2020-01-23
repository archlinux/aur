# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=hovercraft-git
pkgver=313
pkgrel=1
pkgdesc="Makes impress.js presentations from reStructuredText"
arch=('i686' 'x86_64')
url="https://github.com/regebro/hovercraft"
license=('MIT')
groups=()
depends=('python-pygments' 'python-watchdog' 'python-svg.path' 'python-lxml' 'python-docutils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=''
changelog=''
source=('git+https://github.com/regebro/hovercraft.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd hovercraft
    git rev-list --count HEAD
}

package() {
    cd hovercraft
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
