# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.2.7
pkgrel=3
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Grey.zip"
         "$pkgname-$pkgver-lavender.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Lavender.zip"
         "$pkgname-$pkgver-mauve.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Mauve.zip"
         "$pkgname-$pkgver-peach.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Peach.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Pink.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v-0.2.7/Catppuccin-Latte.zip")
sha256sums=('d03aa18bfc114e493c481c656fe280dba3b481a8ee05cb70056ef9648200e246'
            'd133238c3c6475a29246442e48aa6963184281507a420c1e6d32735028c44f9b'
            '7546160b82f9d8aa1d6c185a1e6eb60c209427d0d6a67cf3dd244211d099499a'
            'ba3a35e448317777f897a26a5b44fb4b7ce61d186a1652b526519c33c111d62f'
            'b3a24d2d99be92644a158f515c07bba329915c39955110fb32e337f1d1df5763'
            '739fbf0ed786ee5a84e8a32669386ab8dc5e4cbd7d34d4d2118736c172a9672d'
            'e0339e705b0cce69a1f33ad8beaf12308549732c818c425d53854644e7c202fe'
            '3a6ef40d3d1b6b36c157b72221c8c14f6cdd4bc881913862f11594c9b0e931da'
            '122117d76fa4666a0f24edd7afdb703a8a7e2d62df6497f6ee744b9f26835639'
            'fde83edbfd3d8573e39465268ea884348ab7e55583a8c8079434b25bc6d1fc90')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Green-hdpi" \
        "Catppuccin-Latte-Green-xhdpi" \
        "Catppuccin-Latte-Green" \
        "Catppuccin-Latte-Grey-hdpi" \
        "Catppuccin-Latte-Grey-xhdpi" \
        "Catppuccin-Latte-Grey" \
        "Catppuccin-Latte-Lavender-hdpi" \
        "Catppuccin-Latte-Lavender-xhdpi" \
        "Catppuccin-Latte-Lavender" \
        "Catppuccin-Latte-Mauve-hdpi" \
        "Catppuccin-Latte-Mauve-xhdpi" \
        "Catppuccin-Latte-Mauve" \
        "Catppuccin-Latte-Peach-hdpi" \
        "Catppuccin-Latte-Peach-xhdpi" \
        "Catppuccin-Latte-Peach" \
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
        "Catppuccin-Latte-hdpi" \
        "Catppuccin-Latte-xhdpi" \
        "Catppuccin-Latte" \
        "$pkgdir/usr/share/themes"
}
