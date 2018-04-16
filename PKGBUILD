pkgname=xfce-theme-numix-hdpi
pkgver=1.0
pkgrel=1
pkgdesc="An Xfce Numix theme with taller window title bars suitable for HDPI resolutions"
arch=('any')
url="https://github.com/elmodos/numix-taller"
license=('GPL')
depends=()
makedepends=()
provides=('xfce-theme-numix-hdpi')
source=("https://github.com/elmodos/numix-taller/archive/master.tar.gz")
md5sums=('5da1b72f63d43dc02805ce072ceabe19')

package() {
    mkdir --parents ../pkg/xfce-theme-numix-hdpi/usr/share/themes
    cp --recursive numix-taller-master/Numix-Taller ../pkg/xfce-theme-numix-hdpi/usr/share/themes/Numix-hdpi
}
