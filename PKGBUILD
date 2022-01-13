# Maintainer: Tomasz Buczyński <tomasz.buczynski@student.uj.edu.pl>
pkgname=box-installer
pkgver=1.0
pkgrel=1
pkgdesc="A utility to install and run packages in chroot environments"
arch=("any")
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/box-installer"
license=("MIT")
depends=("pacman")
optdepends=("git: downloading from AUR")
source=("git+https://gitlab.com/ia-projekt-zespolowy-2021-2022/box-installer.git#tag=v1.0")
sha256sums=("SKIP")

build() {
    cd box-installer
    make
}

package() {
    cd box-installer
    make DESTDIR="$pkgdir" install
}
