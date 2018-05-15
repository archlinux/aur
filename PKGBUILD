# Maintainer: Prasad Kumar
# Contributor: Philip Müller <philm@manjaro.org>
pkgname=ms-office-online
pkgver=18.04.4
pkgrel=1
pkgdesc="Microsoft Office Suite Online"
arch=('any')
url="https://github.com/manjaro/ms-office-online-launcher"
license=('GPL3')
depends=('jade-application-kit-git') #minimum of jade-application-kit v0.36 is required and is currently provided by git
source=("https://github.com/manjaro/ms-office-online-launcher/archive/${pkgver}.zip")
sha512sums=('689b2609679a74f03704de4a3de6b3b9c87d328df1f3d966a6245eb940387a5383fd63a3add5fd480b99d2feddcde006a49d9fdb988cc7df65555fae2a0ad811')

package() {
    cd "${pkgname}-launcher-${pkgver}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

