# Submitter: Seqularise <seqularise (a) outlook.com>
pkgname=plasma5-applets-flipweather
pkgver=0.1
pkgrel=1
pkgdesc="A Plasma widget inspired by the clock and weather widget on HTC's phones and tablets."
arch=('any')
url="https://store.kde.org/p/1646881/"
license=('GPL')
depends=('qt5-graphicaleffects' 'kirigami2')
makedepends=()
source=("https://dl1.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2Mzc0MzYwNDciLCJvIjoiMSIsInMiOiIwM2Y1MWY1NWJiZTA2NjQyMjYzNTBhY2E5NDRkMjM4ZTk0ODI3NGIzOTM0M2Q2ZTA0Y2MyZjYyYjQ5NThiN2M4YWFmMjFmODUwMzM5YmIyYjA2NjA2ZGI0NzMzMmFiM2NmOWMwYzdmOTA1MmEwZjliMDgzY2VlNDg2MDIyMTUwMiIsInQiOjE2Mzc1MTY5NTgsInN0ZnAiOm51bGwsInN0aXAiOiIxNzguNDQuMTkuMTk0In0.7OD3ZGdirX5f9YRmR0CUZ4qqaj6tX9S2Agz9dpdfw7E/org.kde.plasma.flipweather.tar.gz")
md5sums=('144a0e3915e131a26fdaa211f978eb85')

package() {
    cd $srcdir/org.kde.plasma.flipweather

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.flipweather
}

