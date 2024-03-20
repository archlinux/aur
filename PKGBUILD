# Maintainer: Your Name <your@email.com>
pkgname=wayscreen
pkgver=1.0
pkgrel=1
pkgdesc="A simple screenshot app running under Wayland"
arch=('x86_64')
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-pip')
source=("install.sh")
sha256sums=()

package() {
    chmod +x install.sh
    ./install.sh || return 1
}
