pkgname=gsettings-desktop-schemas-dummy
pkgver=1
pkgrel=1
pkgdesc="gsettings-desktop-schemas is Gnome desktop only, and not all packages understand that and add it as a dependency."
arch=(any)
url="https://bugs.archlinux.org/task/66849"
license=('GPL')
provides=(gsettings-desktop-schemas)
conflicts=(gsettings-desktop-schemas)
source=()

package() {
    mkdir -p "${pkgdir}"/share/doc/"${pkgname}"/
    rm -f "${pkgdir}"/share/doc/"${pkgname}"/README
    echo "This is a dummy package" >> "${pkgdir}"/share/doc/"${pkgname}"/README
}
