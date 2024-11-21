# Maintainer: Robert Schäfer <aur.archlinux.org@roschaefer.de>
# Contributor: Shi Liang <shiliang2008@msn.com>

pkgname=('graphite-gtk-theme-git'
         'graphite-gtk-theme-wallpaper-git'
         'graphite-gtk-theme-nord-git'
         'graphite-gtk-theme-black-git'
         'graphite-gtk-theme-rimless-git'
         'graphite-gtk-theme-normal-git'
         'graphite-gtk-theme-nord-rimless-git'
         'graphite-gtk-theme-nord-normal-git'
         'graphite-gtk-theme-black-rimless-git'
         'graphite-gtk-theme-black-normal-git'
         'graphite-gtk-theme-rimless-normal-git'
         'graphite-gtk-theme-nord-rimless-normal-git'
         'graphite-gtk-theme-black-rimless-normal-git'
         'graphite-gtk-theme-compact-git'
         'graphite-gtk-theme-nord-compact-git'
         'graphite-gtk-theme-black-compact-git'
         'graphite-gtk-theme-rimless-compact-git'
         'graphite-gtk-theme-normal-compact-git'
         'graphite-gtk-theme-nord-rimless-compact-git'
         'graphite-gtk-theme-nord-normal-compact-git'
         'graphite-gtk-theme-black-rimless-compact-git'
         'graphite-gtk-theme-black-normal-compact-git'
         'graphite-gtk-theme-rimless-normal-compact-git'
         'graphite-gtk-theme-nord-rimless-normal-compact-git'
         'graphite-gtk-theme-black-rimless-normal-compact-git')
_reponame='Graphite-gtk-theme'
pkgver=2024.07.15.r18.g52d8e00
pkgrel=1
pkgdesc='Graphite gtk theme'
arch=("any")
provides=("graphite-gtk-theme")
conflicts=("graphite-gtk-theme")
url="https://github.com/vinceliuice/${_reponame}"
license=("GPL2")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git" "sassc")
source=("git+${url}.git" "Graphite-backgrounds.xml")
sha256sums=('SKIP' 'SKIP')
options=(!strip)

pkgver(){
    cd "${srcdir}/${_reponame}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_graphite-gtk-theme-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}"
}
package_graphite-gtk-theme-wallpaper-git() {
    provides=('graphite-theme-wallpaper')
    conflicts=('graphite-theme-wallpaper')
    optdepends=()

    dist="${pkgdir}/usr/share/backgrounds/Graphite"
    dist2="${pkgdir}/usr/share/gnome-background-properties/"
    mkdir -p "${dist}"
    mkdir -p "${dist2}"
    cp Graphite-backgrounds.xml "${dist2}"
    cd "${srcdir}/${_reponame}/wallpaper"
    cp wallpapers-nord/* "${dist}"
    cp wallpapers/* "${dist}"
}
package_graphite-gtk-theme-nord-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks nord
}
package_graphite-gtk-theme-black-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks black
}
package_graphite-gtk-theme-rimless-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks rimless
}
package_graphite-gtk-theme-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks normal
}
package_graphite-gtk-theme-nord-rimless-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks nord rimless
}
package_graphite-gtk-theme-nord-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks nord normal
}
package_graphite-gtk-theme-black-rimless-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks black rimless
}
package_graphite-gtk-theme-black-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks black normal
}
package_graphite-gtk-theme-rimless-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks rimless normal
}
package_graphite-gtk-theme-nord-rimless-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks nord rimless normal
}
package_graphite-gtk-theme-black-rimless-normal-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" --tweaks black rimless normal
}
package_graphite-gtk-theme-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact
}
package_graphite-gtk-theme-nord-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks nord
}
package_graphite-gtk-theme-black-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks black
}
package_graphite-gtk-theme-rimless-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks rimless
}
package_graphite-gtk-theme-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks normal
}
package_graphite-gtk-theme-nord-rimless-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks nord rimless
}
package_graphite-gtk-theme-nord-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks nord normal
}
package_graphite-gtk-theme-black-rimless-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks black rimless
}
package_graphite-gtk-theme-black-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks black normal
}
package_graphite-gtk-theme-rimless-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks rimless normal
}
package_graphite-gtk-theme-nord-rimless-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks nord rimless normal
}
package_graphite-gtk-theme-black-rimless-normal-compact-git() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -t all -d "${dist}" -s compact --tweaks black rimless normal
}

