# Maintainer: Sanjay Pavan <withercubes@protonmail.com>

pkgname=catppuccin-gtk-theme
pkgver=0.1.3
pkgrel=1
pkgdesc='GTK theme for catppuccin. Warm dark theme for the masses!'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-green-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-green-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-green-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-pink-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-pink-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-pink-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-purple-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-purple-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-purple-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-red-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-red-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-red-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-teal-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-teal-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-teal-dark-compact.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-yellow-dark-compact-hdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-yellow-dark-compact-xhdpi.zip"
        "https://github.com/catppuccin/gtk/releases/download/update_27_01_22/Catppuccin-yellow-dark-compact.zip")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "Catppuccin-dark-compact-hdpi" \
        "Catppuccin-dark-compact-xhdpi" \
        "Catppuccin-dark-compact" \
        "Catppuccin-green-dark-compact-hdpi" \
        "Catppuccin-green-dark-compact-xhdpi" \
        "Catppuccin-green-dark-compact" \
        "Catppuccin-pink-dark-compact-hdpi" \
        "Catppuccin-pink-dark-compact-xhdpi" \
        "Catppuccin-pink-dark-compact" \
        "Catppuccin-purple-dark-compact-hdpi" \
        "Catppuccin-purple-dark-compact-xhdpi" \
        "Catppuccin-purple-dark-compact" \
        "Catppuccin-red-dark-compact-hdpi" \
        "Catppuccin-red-dark-compact-xhdpi" \
        "Catppuccin-red-dark-compact" \
        "Catppuccin-teal-dark-compact-hdpi" \
        "Catppuccin-teal-dark-compact-xhdpi" \
        "Catppuccin-teal-dark-compact" \
        "Catppuccin-yellow-dark-compact-hdpi" \
        "Catppuccin-yellow-dark-compact-xhdpi" \
        "Catppuccin-yellow-dark-compact" \
        "${pkgdir}/usr/share/themes"
}
