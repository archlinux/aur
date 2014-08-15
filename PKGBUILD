pkgname=sddm-futuristic-theme
pkgver=0.1
pkgrel=3
pkgdesc="Futuristic Theme for SDDM"
license=('GPL')
arch=('i686' 'x86_64')
url="http://github.com/bchretien/sddm-futuristic-theme"
makedepends=('git')
depends=('sddm>=0.9.0')
source=("${pkgname}"::"git://github.com/bchretien/sddm-futuristic-theme.git#tag=v${pkgver}")
md5sums=('SKIP')
install="${pkgname}.install"

package() {
    cd ${srcdir}/${pkgname}/futuristic

    install -m 644 -D Main.qml ${pkgdir}/usr/share/sddm/themes/futuristic/Main.qml
    install -m 644 -D theme.conf ${pkgdir}/usr/share/sddm/themes/futuristic/theme.conf
    install -m 644 -D images/angle-down.png ${pkgdir}/usr/share/sddm/themes/futuristic/images/angle-down.png
    install -m 644 -D images/background.png ${pkgdir}/usr/share/sddm/themes/futuristic/images/background.png
}
