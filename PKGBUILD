# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

pkgname=proxydriver
pkgver=1.61
pkgrel=3
pkgdesc="Sets GNOME or KDE proxy settings using NetworkManager's informations"
arch=("any")
url="http://marin.jb.free.fr/proxydriver/"
license=("GPL")
depends=("networkmanager")
optdepends=("gconf" "kdebase-runtime")
source=("https://raw.githubusercontent.com/j1ml/proxydriver/master/proxydriver.sh")
sha256sums=('adf16ba2642b02434c828863710282ba344e1aa147524154d1a2bd630c7513b6')

package() {
    install -Dm755 "${srcdir}/proxydriver.sh" \
     "${pkgdir}/etc/NetworkManager/dispatcher.d/99-proxydriver.sh"
}
