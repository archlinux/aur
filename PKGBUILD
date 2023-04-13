# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.5.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Blue-Light.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Flamingo-Light.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Green-Light.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Lavender-Light.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Maroon-Light.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Mauve-Light.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Peach-Light.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Pink-Light.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Red-Light.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Rosewater-Light.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sapphire-Light.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sky-Light.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Teal-Light.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Yellow-Light.zip")

sha256sums=('aeee7a78c7a23ca39a5154dbb5e9166550827b5cab3b5b5511c59d8a2d4895e2'
            'f765af99529d27d445fd02e0e7a4fd458aa11c3bbf07198711bc43bee281994d'
            '52161b7c1ce5a4e7b8517953ca0cbd75408ffd012cf15932dadac42edaa5f48d'
            '060f39374299b6d2d00e32792f69b2bac92bd2e986757d278fde5b8b6abf9c90'
            '1484a163f3f3e5e907b69b050544731de7e6092236f060df9c2b495c052a1f85'
            'c9cc488cc96cd0b0428f7c64fa6fad628361580f586853475fa1e17b6a00b11f'
            '674c47891b671aa7e6757f5671b6fa4343906b8dd982f23c7cdc0d048a9d63b6'
            'c2b0b6af60037c6ea66572c7b4e19cefb71aed72b491833a9193c3eb7126cb74'
            '2addf80cbba13c0061c4d9cbf559fa4f6a075783b51b9073d3677ec255a2aff5'
            '89be45d169cb86487f0ad3c59f6dbc87eb3fc80af2d2f62c72372a6df1302a1a'
            '37e694a9fbf7cbed5ce6958b39246e3b8ba004907c8a64ff5f69a0825ef8a61e'
            'f9138744586bf658df90a85e89d95151dd78754041768220bac07303763d89c1'
            '2be6c71f2d93397ab74071650324a38116d5f1bfb1fcc7a690489b222b74557c'
            'ac58a8e5638427605b04dea106866b79951ad382f03ffe7f496a21e3d317fa08')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Standard-Blue-Light-hdpi" \
        "Catppuccin-Latte-Standard-Blue-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Blue-Light" \
        "Catppuccin-Latte-Standard-Flamingo-Light-hdpi" \
        "Catppuccin-Latte-Standard-Flamingo-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Flamingo-Light" \
        "Catppuccin-Latte-Standard-Green-Light-hdpi" \
        "Catppuccin-Latte-Standard-Green-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Green-Light" \
        "Catppuccin-Latte-Standard-Lavender-Light-hdpi" \
        "Catppuccin-Latte-Standard-Lavender-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Lavender-Light" \
        "Catppuccin-Latte-Standard-Maroon-Light-hdpi" \
        "Catppuccin-Latte-Standard-Maroon-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Maroon-Light" \
        "Catppuccin-Latte-Standard-Mauve-Light-hdpi" \
        "Catppuccin-Latte-Standard-Mauve-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Mauve-Light" \
        "Catppuccin-Latte-Standard-Peach-Light-hdpi" \
        "Catppuccin-Latte-Standard-Peach-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Peach-Light" \
        "Catppuccin-Latte-Standard-Pink-Light-hdpi" \
        "Catppuccin-Latte-Standard-Pink-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Pink-Light" \
        "Catppuccin-Latte-Standard-Red-Light-hdpi" \
        "Catppuccin-Latte-Standard-Red-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Red-Light" \
        "Catppuccin-Latte-Standard-Rosewater-Light-hdpi" \
        "Catppuccin-Latte-Standard-Rosewater-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Rosewater-Light" \
        "Catppuccin-Latte-Standard-Sapphire-Light-hdpi" \
        "Catppuccin-Latte-Standard-Sapphire-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Sapphire-Light" \
        "Catppuccin-Latte-Standard-Sky-Light-hdpi" \
        "Catppuccin-Latte-Standard-Sky-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Sky-Light" \
        "Catppuccin-Latte-Standard-Teal-Light-hdpi" \
        "Catppuccin-Latte-Standard-Teal-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Teal-Light" \
        "Catppuccin-Latte-Standard-Yellow-Light-hdpi" \
        "Catppuccin-Latte-Standard-Yellow-Light-xhdpi" \
        "Catppuccin-Latte-Standard-Yellow-Light" \
        "$pkgdir/usr/share/themes"
}
