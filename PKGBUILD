# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.2.7
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
depends=('gtk-engine-murrine' 'gnome-themes-extra')
url='https://github.com/catppuccin/gtk'
source=("${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Green.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Grey.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Peach.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Pink.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Purple.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Red.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Teal.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe-Yellow.zip"
         "${url}/releases/download/v-0.2.7/Catppuccin-Frappe.zip")
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
    cp -r "Catppuccin-Frappe-Green-hdpi" \
        "Catppuccin-Frappe-Green-xhdpi" \
        "Catppuccin-Frappe-Green" \
        "Catppuccin-Frappe-Grey-hdpi" \
        "Catppuccin-Frappe-Grey-xhdpi" \
        "Catppuccin-Frappe-Grey" \
        "Catppuccin-Frappe-Purple-hdpi" \
        "Catppuccin-Frappe-Purple-xhdpi" \
        "Catppuccin-Frappe-Purple" \
        "Catppuccin-Frappe-Red-hdpi" \
        "Catppuccin-Frappe-Red-xhdpi" \
        "Catppuccin-Frappe-Red" \
        "Catppuccin-Frappe-Teal-hdpi" \
        "Catppuccin-Frappe-Teal-xhdpi" \
        "Catppuccin-Frappe-Teal" \
        "Catppuccin-Frappe-Yellow-hdpi" \
        "Catppuccin-Frappe-Yellow-xhdpi" \
        "Catppuccin-Frappe-Yellow" \
        "Catppuccin-Frappe" \
        "${pkgdir}/usr/share/themes"
}
