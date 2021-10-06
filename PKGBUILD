# Original Maintaner: Manuel Schneider <manuelschneid3r at googles mail>
# AUR Maintaner: Mochammad Naufal Septifiandi <septifiandinaufal at gmail dot com>

pkgname=albert-bin
pkgver=0.17.2
pkgrel=0
pkgdesc='A sophisticated standalone keyboard launcher. Binary version.'
arch=('x86_64')
url='https://github.com/albertlauncher'
license=('GPL')
depends=('qt5-charts' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg' 'qt5-x11extras')
optdepends=('muparser: Calculator plugin'
            'python: Python extension'
            'virtualbox: VirtualBox plugin')
provides=('albert')
conflicts=('albert' 'albert-git' 'albert-minimal')
source=("https://download.opensuse.org/repositories/home:/manuelschneid3r/Arch/$arch/albert-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha512sums=('SKIP')

package() {
    mv usr "$pkgdir/"
}
