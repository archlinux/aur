 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>

pkgbase=madkitas-plasma5-themes
pkgname=('plasma5-theme-aex-nomad-git' 'plasma5-theme-breeze-noshadow-antu-git' 'plasma5-theme-breeze-transparent-nomad-icons-git')
pkgver=r24.cd544bd
pkgrel=1
pkgdesc="3 nice looking plasma5 themes by Madkita"
arch=('any')
url='https://github.com/Madkita/Plasma-Themes.git'
license=('GPL3')
depends=('plasma-desktop')
makedepends=('git')
source=("${pkgbase}-${pkgver}::git+${url}")
sha256sums=('SKIP')


pkgver() {
   cd  ${srcdir}/${pkgbase}-${pkgver}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package_plasma5-theme-aex-nomad-git() {
pkgdesc="Half transparent rounded corners shadowed macOS looking like theme"

   cd  ${srcdir}/${pkgbase}-${pkgver}
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Aex\ Nomad
   cp -r Aex\ Nomad ${pkgdir}/usr/share/plasma/desktoptheme/
}

package_plasma5-theme-breeze-noshadow-antu-git() {
pkgdesc="Default kde breeze theme without panel shadows and with icons from antu icon theme"

   cd  ${srcdir}/${pkgbase}-${pkgver}
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/Breeze\ No\ shadow\ antu
   cp -r Breeze\ No\ shadow\ antu ${pkgdir}/usr/share/plasma/desktoptheme/
}

package_plasma5-theme-breeze-transparent-nomad-icons-git() {
pkgdesc="Breeze transparent theme with icons from nomad project"

   cd  ${srcdir}/${pkgbase}-${pkgver}
   mkdir -p ${pkgdir}/usr/share/plasma/desktoptheme/breeze\ transparent\ with\ nomad\ icons
   cp -r breeze\ transparent\ with\ nomad\ icons ${pkgdir}/usr/share/plasma/desktoptheme/
}
