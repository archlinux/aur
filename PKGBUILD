# Maintainer: Your Name <your@email.com>
pkgname=wayscreen
pkgver=1.0
pkgrel=1
pkgdesc="A simple screenshot app running under Wayland"
arch=('x86_64')
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-pip')
makedepends=('git')

source=("git+https://github.com/yarchefis/wayscreen.git")

package() {
    cd "$srcdir/wayscreen" || return 1
    
    # Ensure permissions for install.sh
    chmod +x install.sh
    
    # Execute install.sh
    ./install.sh || return 1
}
