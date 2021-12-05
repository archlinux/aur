# Submitter: Seqularise <seqularise (a) outlook.com>
pkgname=plasma5-applets-flipweather
pkgver=0.2
pkgrel=1
pkgdesc="A Plasma widget inspired by the clock and weather widget on HTC's phones and tablets."
arch=('any')
url="https://store.kde.org/p/1646881/"
license=('GPL')
depends=('qt5-graphicaleffects' 'kirigami2')
makedepends=()
source=("https://i-glu4it.ru/qml/org.kde.plasma.flipweather.0.2.tar.gz")
md5sums=('d9a9a974d0a8b4d673f121f0e43b5304')

package() {
    cd $srcdir/org.kde.plasma.flipweather

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
}

