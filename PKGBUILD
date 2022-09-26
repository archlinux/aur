# Maintainer: spookyintheam <spookyintheam@protonmail.com> 
# Contributor: Luis Martinez <luis dot martinez dot at disroot dot org>

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.2.7
pkgrel=3
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Grey.zip"
         "$pkgname-$pkgver-peach.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Peach.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Pink.zip"
         "$pkgname-$pkgver-purple.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Purple.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v-0.2.7/Catppuccin-Frappe.zip")
sha256sums=('491675afee73c9e112ae1c5f31f81444728e80e93365291a51058db5b7fbf6fb'
            '8724d42319f0717780d231d1596ba7ef2a505a924c8a3d9aeda949dce3f4fbaa'
            '7dea27cfe14009cbc7fb596a377a2e8fe08c617d48cbaa58f2f5682a827311ee'
            'd7d3db032433f98e93dbfece5de24b03eefafe947f3f0043e100730e783c62ff'
            '59ef39ca3c232d36c6a86fd82599a3e83940a1afef578ecdf4d072ab3c7726b4'
            'a0ca5e8a4732a358373da5a37a29e14c0bde0a2ba099b87724f77331caa8f315'
            '0077b5713db80b369386e38cdf2212b1a75b233d6b4fc04e67aa9d827e4bd7f6'
            '646b7639b95d3ef368b8e84a69bb7f3631fe3a4f882b1ef187586c1cac6bd14d'
            'b2950366d29ff204162a3f34d9bc1eb33ee628f7261ea284a43b3415aa18e81f')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Green-hdpi" \
        "Catppuccin-Frappe-Green-xhdpi" \
        "Catppuccin-Frappe-Green" \
        "Catppuccin-Frappe-Grey-hdpi" \
        "Catppuccin-Frappe-Grey-xhdpi" \
        "Catppuccin-Frappe-Grey" \
        "Catppuccin-Frappe-Peach-hdpi" \
        "Catppuccin-Frappe-Peach-xhdpi" \
        "Catppuccin-Frappe-Peach" \
        "Catppuccin-Frappe-Pink-hdpi" \
        "Catppuccin-Frappe-Pink-xhdpi" \
        "Catppuccin-Frappe-Pink" \
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
        "Catppuccin-Frappe-hdpi" \
        "Catppuccin-Frappe-xhdpi" \
        "Catppuccin-Frappe" \
        "$pkgdir/usr/share/themes"
}
