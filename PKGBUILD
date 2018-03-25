 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>

pkgbase=madkitas-plasma5-themes
pkgname=('plasma5-theme-aex-nomad-git' 'plasma5-theme-breeze-noshadow-antu-git' 'plasma5-theme-breeze-transparent-nomad-icons-git' 'plasma5-theme-aex-nomad-dark-git')
pkgver=r41.dd58091
pkgrel=1
pkgdesc="3 nice looking plasma5 themes by Madkita"
arch=('any')
url='https://github.com/Madkita/Plasma-Themes'
license=('GPL3')
depends=('plasma-desktop')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')


pkgver() {
   cd  ${srcdir}/Plasma-Themes
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package_plasma5-theme-aex-nomad-git() {
pkgdesc="Half transparent rounded corners shadowed macOS looking like theme"

   cd  ${srcdir}/Plasma-Themes
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Aex\ Nomad
   cp -r Aex\ Nomad ${pkgdir}/usr/share/plasma/desktoptheme/
}

package_plasma5-theme-breeze-noshadow-antu-git() {
pkgdesc="Default kde breeze theme without panel shadows and with icons from antu icon theme"

   cd  ${srcdir}/Plasma-Themes
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Breeze\ No\ shadow\ antu
   cp -r Breeze\ No\ shadow\ antu ${pkgdir}/usr/share/plasma/desktoptheme/
}

package_plasma5-theme-breeze-transparent-nomad-icons-git() {
pkgdesc="Breeze transparent theme with icons from nomad project"

   cd  ${srcdir}/Plasma-Themes
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/breeze\ transparent\ with\ nomad\ icons
   cp -r breeze\ transparent\ with\ nomad\ icons ${pkgdir}/usr/share/plasma/desktoptheme/
}

package_plasma5-theme-aex-nomad-dark-git() {
pkgdesc="Breeze transparent theme with icons from nomad project"

   cd  ${srcdir}/Plasma-Themes
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Aex\ Nomad\ Dark
   cp -r Aex\ Nomad\ Dark ${pkgdir}/usr/share/plasma/desktoptheme/
}
