# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ubuntu-mate-themes-classic"
_pkgname="ubuntu-mate-themes"
pkgver="20.04.2"
pkgrel="1"
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE - Non-Yaru"
arch=("any")
url="https://launchpad.net/ubuntu-mate/"
license=("GPL3")
groups=("mate-extra")
depends=("gtk-engine-murrine" "ubuntu-mate-icon-themes")
source=("${_pkgname}-${pkgver}.tar.gz::http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${_pkgname}_${pkgver}_all.deb")
sha256sums=("449cd6819855efc3a9c38ac48d03db39643b2a90163852d3ef1935e664a5407b")
replaces=(${_pkgname})
conflicts=(${_pkgname})

package()
{
    tar xf data.tar.xz
    mv usr $pkgdir/
}
