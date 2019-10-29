# Maintainer: Nathan Simmonds <arch@nsimmonds.com>
pkgname=plasma5-applets-kde-arch-update-notifier
pkgver=7.2.1
pkgrel=1
pkgdesc="A KDE plasmoid for your system tray notifying you of available updates with AUR Support"
url="https://github.com/I-Dream-in-Code/kde-arch-update-plasmoid"
arch=('any')
license=('GPL')
depends=("fakeroot" "konsole" "pacman-contrib" "plasma-desktop" "plasma-framework" "qt5-xmlpatterns")
optdepends=("checkupdates-aur" "snapd" "yakuake")
makedepends=("make" "cmake" "git" "extra-cmake-modules")
conflicts=(plasma5-applets-kde-arch-update-notifier-git)
replaces=(plasma5-applets-kde-arch-update-notifier-git)
backup=()
install=
source=("$url/archive/$pkgver.tar.gz")
md5sums=("SKIP")

build() {
    mkdir "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    #cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    make install
}
