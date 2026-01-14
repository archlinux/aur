# Maintainer: Camila 'Mocha' Rose
pkgname=ruarch
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple AUR helper written in Ruby"
arch=('any')
url="https://github.com/mochacinno-dev/rua"
license=('GNU GPLv3')
depends=('ruby' 'git' 'base-devel' 'pacman')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/rua"
    
    # Install the main executable
    install -Dm755 rua "$pkgdir/usr/bin/rua"
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/rua/README.md"
}