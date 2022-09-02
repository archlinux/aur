# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.2.7
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("${url}/releases/latest/download/Catppuccin-Latte-Green.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Grey.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Lavender.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Mauve.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Peach.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Pink.zip"
         "${url}/releases/latest/download//Catppuccin-Latte-Red.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Teal.zip"
         "${url}/releases/latest/download/Catppuccin-Latte-Yellow.zip"
         "${url}/releases/latest/download/Catppuccin-Latte.zip")
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
    cp -r "Catppuccin-Latte-Green-hdpi" \
        "Catppuccin-Latte-Green-xhdpi" \
        "Catppuccin-Latte-Green" \
        "Catppuccin-Latte-Grey-hdpi" \
        "Catppuccin-Latte-Grey-xhdpi" \
        "Catppuccin-Latte-Grey" \
        "Catppuccin-Latte-Mauve-hdpi" \
        "Catppuccin-Latte-Mauve-xhdpi" \
        "Catppuccin-Latte-Mauve" \
        "Catppuccin-Latte-Pink-hdpi" \
        "Catppuccin-Latte-Pink-xhdpi" \
        "Catppuccin-Latte-Pink" \
        "Catppuccin-Latte-Red-hdpi" \
        "Catppuccin-Latte-Red-xhdpi" \
        "Catppuccin-Latte-Red" \
        "Catppuccin-Latte-Teal-hdpi" \
        "Catppuccin-Latte-Teal-xhdpi" \
        "Catppuccin-Latte-Teal" \
        "Catppuccin-Latte-Yellow-hdpi" \
        "Catppuccin-Latte-Yellow-xhdpi" \
        "Catppuccin-Latte-Yellow" \
        "Catppuccin-Latte" \
        "${pkgdir}/usr/share/themes"
}
