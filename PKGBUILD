# Maintainer: spookyintheam <spookyintheam@protonmail.com>
pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.2.7
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Green.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Grey.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Mauve.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Orange.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Pink.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Red.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Teal.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato-Yellow.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Macchiato.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
package() {
    mkdir -p "$pkgdir/usr/share/themes"
    cp -r "Catppuccin-Macchiato-Green-hdpi" \
        "Catppuccin-Macchiato-Green-xhdpi" \
        "Catppuccin-Macchiato-Green" \
        "Catppuccin-Macchiato-Grey-hdpi" \
        "Catppuccin-Macchiato-Grey-xhdpi" \
        "Catppuccin-Macchiato-Grey" \
        "Catppuccin-Macchiato-Mauve-hdpi" \
        "Catppuccin-Macchiato-Mauve-xhdpi" \
        "Catppuccin-Macchiato-Mauve" \
        "Catppuccin-Macchiato-Orange-hdpi" \
        "Catppuccin-Macchiato-Orange-xhdpi" \
        "Catppuccin-Macchiato-Orange" \
        "Catppuccin-Macchiato-Pink-hdpi" \
        "Catppuccin-Macchiato-Pink-xhdpi" \
        "Catppuccin-Macchiato-Pink" \
        "Catppuccin-Macchiato-Red-hdpi" \
        "Catppuccin-Macchiato-Red-xhdpi" \
        "Catppuccin-Macchiato-Red" \
        "Catppuccin-Macchiato-Teal-hdpi" \
        "Catppuccin-Macchiato-Teal-xhdpi" \
        "Catppuccin-Macchiato-Teal" \
        "Catppuccin-Macchiato-Yellow-hdpi" \
        "Catppuccin-Macchiato-Yellow-xhdpi" \
        "Catppuccin-Macchiato-Yellow" \
        "Catppuccin-Macchiato" \
        "${pkgdir}/usr/share/themes"
}
