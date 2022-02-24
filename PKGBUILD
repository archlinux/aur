# Maintainer: Sanjay Pavan <withercubes@protonmail.com>

pkgname=catppuccin-gtk-theme
pkgver=0.1.4
pkgrel=1
pkgdesc='GTK theme for catppuccin. Warm dark theme for the masses!'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-blue.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-green.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-orange.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-pink.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-purple.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-red.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-teal.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-yellow.zip")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "Catppuccin-blue-hdpi" \
        "Catppuccin-blue-xhdpi" \
        "Catppuccin-blue" \
        "Catppuccin-green-hdpi" \
        "Catppuccin-green-xhdpi" \
        "Catppuccin-green" \
        "Catppuccin-pink-hdpi" \
        "Catppuccin-pink-xhdpi" \
        "Catppuccin-pink" \
        "Catppuccin-purple-hdpi" \
        "Catppuccin-purple-xhdpi" \
        "Catppuccin-purple" \
        "Catppuccin-red-hdpi" \
        "Catppuccin-red-xhdpi" \
        "Catppuccin-red" \
        "Catppuccin-teal-hdpi" \
        "Catppuccin-teal-xhdpi" \
        "Catppuccin-teal" \
        "Catppuccin-yellow-hdpi" \
        "Catppuccin-yellow-xhdpi" \
        "Catppuccin-yellow" \
        "${pkgdir}/usr/share/themes"
}
