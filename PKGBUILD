# Maintainer: halsschmerzen <bastiansteampl@gmail.com>

pkgname=quickrice
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple CLI Tool to change GTK Based desktops"
arch=('any')
url="https://github.com/halsschmerzen/quickrice"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/halsschmerzen/quickrice.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/quickrice"

    # Run the install.sh script with --global option
    sudo ./install.sh install --global
}
