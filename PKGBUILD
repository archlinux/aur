# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.2.7
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Green.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Grey.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Lavender.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Mauve.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Peach.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Pink.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Red.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Teal.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha-Yellow.zip"
        "${url}/releases/download/v-0.2.7/Catppuccin-Mocha.zip")
sha256sums=('SKIP'
            'SKIP'
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
    cp -r "Catppuccin-Mocha-Green-hdpi" \
        "Catppuccin-Mocha-Green-xhdpi" \
        "Catppuccin-Mocha-Green" \
        "Catppuccin-Mocha-Grey-hdpi" \
        "Catppuccin-Mocha-Grey-xhdpi" \
        "Catppuccin-Mocha-Grey" \
        "Catppuccin-Mocha-Mauve-hdpi" \
        "Catppuccin-Mocha-Mauve-xhdpi" \
        "Catppuccin-Mocha-Mauve" \
        "Catppuccin-Mocha-Pink-hdpi" \
        "Catppuccin-Mocha-Pink-xhdpi" \
        "Catppuccin-Mocha-Pink" \
        "Catppuccin-Mocha-Red-hdpi" \
        "Catppuccin-Mocha-Red-xhdpi" \
        "Catppuccin-Mocha-Red" \
        "Catppuccin-Mocha-Teal-hdpi" \
        "Catppuccin-Mocha-Teal-xhdpi" \
        "Catppuccin-Mocha-Teal" \
        "Catppuccin-Mocha-Yellow-hdpi" \
        "Catppuccin-Mocha-Yellow-xhdpi" \
        "Catppuccin-Mocha-Yellow" \
        "Catppuccin-Mocha" \
        "${pkgdir}/usr/share/themes"
}
