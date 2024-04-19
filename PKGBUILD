# Maintainer: Alan Sartorio

pkgname=orchis-theme
pkgver=2024_04_18
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
options=(!strip)
replaces=("${pkgname}-bin")
arch=('any')
conflicts=("${pkgname}")
url="https://github.com/vinceliuice/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('b84c8b824c9d17c13ec74954a2479a7ca301effb506718ec09849f8ae8978818')
license=('GPL3')

package() {
    cd "Orchis-theme-${pkgver//_/-}"

    install -dm755 "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes"
}
