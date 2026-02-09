# Maintainer: ACE : acedmicabhishek@gmail.com

pkgname=kernel-drive
pkgver=0.1.2
pkgrel=4
pkgdesc="A high-performance modular system control app for Arch Linux"
arch=('x86_64')
url="https://github.com/acedmicabhishek/KernelDrive"
license=('MIT')
depends=('gtk4' 'libadwaita' 'polkit')
makedepends=('meson' 'git' 'gcc')
source=("git+https://github.com/acedmicabhishek/KernelDrive.git")
md5sums=('SKIP')

build() {
    arch-meson KernelDrive build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
