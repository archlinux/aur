# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.6.2
pkgrel=2
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

sha256sums=('39f469bbda3a6fdfd0521fe564dde08567df4cf868f0d45325be8a6296100cd4'
            '7d4325a4c3b8845c664ae4d241c72c7ce2224f33e7eb88be46b8e9598c5a6d2d'
            '8d99dc8458f7555bd3151540a1af9d69febb04772eabb00ee2a6fc19a2fc726c'
            'b8ed1e954e5e0740c97f6c598e056fd548f0b68fb24c0bdb65b55675fc17db59'
            'fa34f0a46612ef620af5df5dda067c8d5db0b53fc957a7d334db072ac4b9dd96'
            'f00f186d206d56346faddc852e2c58978b73305135b33b4b0448d67e941c1a11'
            '77a973340539f9f1a4f7fd9b60e3a5849904802caf4ff8e531c5bc9dc29cadb6'
            '37aada7250792c9905bf95c80e1f4426d082085d73f4c6a368a40e1f1cce2a7d'
            '63af7a4668e5e156a9c57cc0f610d4982c322858ab604192d138e1f222863194'
            'fe5ba2bdf8bac439be1780f550a7253ffd373d969e28a667d10a1dbe77b20271'
            'ea59962afb78debb520d637219854dd40a234dad462bfcb3692f78e75cc4ebf4'
            '989f21c13bc6043ac957ea2c2ae8ef67f2cf2489857004565298c486aeb54c81'
            '2597a73b0a544606aa0536def673086a02ca47c918451017b2fd3b9b760e14b6'
            '23d84e509daeb862b99ccf31c7c37a81227d4cf145676a6417f588ace2f6c51c')
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
