# Maintainer: Marcs <aur (at) odd (dot) red>

pkgname=proxydriver
pkgver=1.62
pkgrel=1
pkgdesc="Sets GNOME or KDE proxy settings using NetworkManager's informations"
arch=("any")
url="http://marin.jb.free.fr/proxydriver/"
license=("GPL")
depends=("networkmanager")
optdepends=("gconf" "kdebase-runtime")
source=("proxydriver.sh::http://sourceforge.net/p/proxydriver/code/HEAD/tree/src/v1.62/proxydriver.sh?format=raw")
sha256sums=('3989e43c5ff8ab520e0a6f599dc189f6ee538e8207d9d5d42e10b914bbbf1c93')

package() {
    install -Dm755 "${srcdir}/proxydriver.sh" \
     "${pkgdir}/etc/NetworkManager/dispatcher.d/99-proxydriver.sh"
}
