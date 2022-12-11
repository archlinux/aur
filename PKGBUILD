# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.3.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Blue.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Flamingo.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Green.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Lavender.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Maroon.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Mauve.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Peach.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Pink.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Red.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Rosewater.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sapphire.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sky.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Teal.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Yellow.zip")

sha256sums=('31bd2b82a1a0ef6ecbd884388d3c5012f5aa7dd1f8ab6a91185c05a205947319'
            'fed8a37bdb704beea5f31d31418a8f9bb3f28ddd90fdfcd4a239faf1455d2dd2'
            'e6ed8960ee9591b717b001d1cdfcd9b9941edb3bcf6560477f15a51e09a47289'
            '188195df13e1d1c79970ee12f821721499a01049baf485490920254d690544fe'
            '5a4bc928396000c10361ca12c926d40494c35eb4477ffa628a8fed76379f9eb5'
            '342bb2fcff1f318a8da92c38098d99a059923ba48bd0b598ae76ddf318b0c42e'
            '6f5385d6f876b38d49d0fd9b06960ee4429cc8e4904b54517272c66bb0e62c7c'
            'f841fea5780854471aa20223a6788141d15c401157c5111109bb750ca5e017a6'
            'c03c68008325efe79658a651bd472d4a0a21f4d791bab88912099bbff8bb4407'
            '0d37610b67d7a20f1ba32e904bdb0b996543e5541512fa059f56aa86da6c64c7'
            'eccdf7af7b572a01131fbfca4f5e3cdb82f69b546b8a090dc035ce6a5618af96'
            'd7b717ed837cc32aa461fbdf7b2083767fbd04a2f0e5b307e85da3a1fe0099e7'
            'c0a334985f391eff74dbb85b1696fc01a7f88b95bda7434777f7e4f69edbe85a'
            '422244474dc74d6cb1f3e58d152d75709904ee19a388eeb2899f08d2de53544e')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Latte-Standard-Blue-hdpi" \
        "Catppuccin-Latte-Standard-Blue-xhdpi" \
        "Catppuccin-Latte-Standard-Blue" \
        "Catppuccin-Latte-Standard-Flamingo-hdpi" \
        "Catppuccin-Latte-Standard-Flamingo-xhdpi" \
        "Catppuccin-Latte-Standard-Flamingo" \
        "Catppuccin-Latte-Standard-Green-hdpi" \
        "Catppuccin-Latte-Standard-Green-xhdpi" \
        "Catppuccin-Latte-Standard-Green" \
        "Catppuccin-Latte-Standard-Lavender-hdpi" \
        "Catppuccin-Latte-Standard-Lavender-xhdpi" \
        "Catppuccin-Latte-Standard-Lavender" \
        "Catppuccin-Latte-Standard-Maroon-hdpi" \
        "Catppuccin-Latte-Standard-Maroon-xhdpi" \
        "Catppuccin-Latte-Standard-Maroon" \
        "Catppuccin-Latte-Standard-Mauve-hdpi" \
        "Catppuccin-Latte-Standard-Mauve-xhdpi" \
        "Catppuccin-Latte-Standard-Mauve" \
        "Catppuccin-Latte-Standard-Peach-hdpi" \
        "Catppuccin-Latte-Standard-Peach-xhdpi" \
        "Catppuccin-Latte-Standard-Peach" \
        "Catppuccin-Latte-Standard-Pink-hdpi" \
        "Catppuccin-Latte-Standard-Pink-xhdpi" \
        "Catppuccin-Latte-Standard-Pink" \
        "Catppuccin-Latte-Standard-Red-hdpi" \
        "Catppuccin-Latte-Standard-Red-xhdpi" \
        "Catppuccin-Latte-Standard-Red" \
        "Catppuccin-Latte-Standard-Rosewater-hdpi" \
        "Catppuccin-Latte-Standard-Rosewater-xhdpi" \
        "Catppuccin-Latte-Standard-Rosewater" \
        "Catppuccin-Latte-Standard-Sapphire-hdpi" \
        "Catppuccin-Latte-Standard-Sapphire-xhdpi" \
        "Catppuccin-Latte-Standard-Sapphire" \
        "Catppuccin-Latte-Standard-Sky-hdpi" \
        "Catppuccin-Latte-Standard-Sky-xhdpi" \
        "Catppuccin-Latte-Standard-Sky" \
        "Catppuccin-Latte-Standard-Teal-hdpi" \
        "Catppuccin-Latte-Standard-Teal-xhdpi" \
        "Catppuccin-Latte-Standard-Teal" \
        "Catppuccin-Latte-Standard-Yellow-hdpi" \
        "Catppuccin-Latte-Standard-Yellow-xhdpi" \
        "Catppuccin-Latte-Standard-Yellow" \
        "$pkgdir/usr/share/themes"
}
