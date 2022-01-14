# Maintainer: Sanjay Pavan <tsppavan7@gmail.com>

pkgname=catppuccin-gtk-theme
pkgver=1.0.0
pkgrel=1
pkgdesc='GTK theme for catppuccin. Warm dark theme for the masses!'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-green.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-magenta.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-peach.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-pink.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-red.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-teal.tar.gz"
        "https://github.com/catppuccin/gtk/releases/download/v.${pkgver}/Catppuccin-yellow.tar.gz")
sha256sums=('b80b74835fe011351569c64f51cf9235f13496e619dc5c168c133432c92ca332'
            '1966add65592a814266bb7ccb2afb619e8e5623b076602f072b3bfd1f0a4b226'
            '4eb8752dd99717d6dced36a29d42dfddbc4d4b28880ef28d50982ea1fe5329d5'
            '51b2cd898ab60b0fc162405255604d78cf2f4dde436be840d311e38442952cc2'
            '2ff2a62da106fbc0b6e0333d9e3e4b339a1fdb943276c5c3b0e46b8b82d1aba8'
            'a4b50e1f10df283f49d6a87dc0b40d33cd7be406867d1bdc7e8451f3f5a87275'
            'f3b66d136f9a98f42d3c9c22d0338cb1b640c1fe42ac0754de1e6fb925cd89a9'
            '03f473062189f4da0ac3a58e067003b882b1196e4bb903437856df5ebd6c36d2')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "Catppuccin" \
        "Catppuccin-green" \
        "Catppuccin-magenta" \
        "Catppuccin-peach" \
        "Catppuccin-pink" \
        "Catppuccin-red" \
        "Catppuccin-teal" \
        "Catppuccin-yellow" \
        "${pkgdir}/usr/share/themes"
}
