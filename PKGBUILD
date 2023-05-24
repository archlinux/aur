# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.6.0
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

sha256sums=('56041ff44e3b7b52238562dcd89779271596a4b54fabac74afbc17e05b199227'
            'ef7c9c810911e8e628f1e4b50cdb71c4d06cd3ee1b0fbe80cd28100bb7e00541'
            '2e379bf154d828a794aec105fd324380cb60c53b2f5c5230cdf35410acd0b315'
            '49343d75d172b060f9e2cdfe0a85d3382b5d89fa8d57311be6427ee42c35e53c'
            '7d39d7da2dd7145e5564d6cba6aaf36295328dbcf0dad0778affceb055eac6e0'
            '2991af922175f800ed0d0c124c209d6934a876779ebb136ab41bfa8c3164fe43'
            '7f7e16bb0b2ba6f1d6cb089192959605fbe3da1236c4737e8cff8220bf89fe22'
            'e3d43b06ce2e022e8222f5f1ebde6c517d2f2bc41f0f18bc43cb4acf2655df4d'
            '4738e66ef6c82e11f41e3fdd795d8f21286f5444332b475962492ce22f6c7179'
            'a55c641328b0527bf2c6abb2871b682c283e00855dcd08f526493c7ed6a6b284'
            'a981d9ee87517b9dcedc325b8d0e3fec237f797770f67e259d6897ff10af358d'
            '262fc82d8d717eefd557491e3d21ab8ed34f4bcd65ead3dfaa739c4fd160cb28'
            '7a9b6bad0bb71cb08f91f836bfd8d39b905b8773f60f7a30d844a612868160a5'
            '7bd05aefd6d835e1ea30fc6aeb3c25b68bf37c53542eaa940020f9ca3713ab6d')
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
