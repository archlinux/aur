pkgname=spores
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive TUI explorer for Arch Linux package dependencies"
arch=('any')
url="https://github.com/mossware/spores"
license=('MIT')
depends=('python' 'python-textual')
source=("git+https://github.com/mossware/spores.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/spores"
}

package() {
    cd "$srcdir/spores"
    
    install -Dm755 spores.py "$pkgdir/usr/bin/spores"
}
