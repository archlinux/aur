# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.3.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Green.zip"
         "$pkgname-$pkgver-grey.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Grey.zip"
         "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Peach.zip"
         "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Pink.zip"
         "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Red.zip"
         "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Teal.zip"
         "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Yellow.zip"
         "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Catppuccin-Latte.zip")
sha256sums=('4477d071617574e34d7ea4c122ffd6d594ec9768451b19a91975149f780b8460'
            '27d24b7e52a91ee67eeae8822eb3bef614f47100cc2c7320c64738b877088cbe'
            '221f3a84116d127adc417ca967fcfed9d111cc511d9e89fffc28bfef29f9d71c'
            '1df87bf9368333adabca5ac8481dc235dc357539bfcc3264980252ca116abc06'
            '650ee6407a983dd4bf382bf418e12956f6f018871ea3fe76bc7dd1bf2fbb7a19'
            '0a5ee6eaf9a2014127354a817a33dfa491e8004dcc10c0eea7e5888fc9c0dc15'
            'd097df5fedba133d347dcae87b51b8111ac2e0fd39aede38bcd6f68b18391561'
            '376cf1170ab38a9010d891265ce1c646ffc70a68950c1fa2a6d74dc375b9d23e')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Green-hdpi" \
        "Catppuccin-Latte-Green-xhdpi" \
        "Catppuccin-Latte-Green" \
        "Catppuccin-Latte-Grey-hdpi" \
        "Catppuccin-Latte-Grey-xhdpi" \
        "Catppuccin-Latte-Grey" \
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
