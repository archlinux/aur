# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.4.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
depends=('gtk-engine-murrine' 'gnome-themes-extra')
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

sha256sums=('64dd89421d5f3e9b59d8cce2cba4d5468f5011bc53eb4dad65621530157ca471'
            '2163e8a5666accd3b44502a6914bb70fde54a7fceff7a2b980c51a85859f92ec'
            'eac801ba757bdbe63935d6af0dc3e02262925c1e55c8b8c73d387a81041d01d2'
            '8894bcdc189274391f6f087e754c798b2952736d26c800585b0482a60cd00831'
            'c8c04aadddb8ab31dc676aec81148244bbdfaf61ba42c67f358f042ced89228b'
            'dcf594fa82b0525a8503346bff9288931b98e53355003157418a6e0ad7200f1e'
            '4675264bff4f3c5b16e012acf54e39ba28d80cf53f7d24a09f1f7c3368b03cd9'
            'dfd34597fa0e6d622cf2ddf39aa77b32d66451be2c2888968efcb8fb21f98ac6'
            'f4e831af4115b3ce0bbb7158fd0d40ae2e73875fb928e22622ba87477e433dcd'
            '48cab924f4be539a07fd328552907476f43059614b40411decffa7df163ad159'
            '2da0fc0f6f94c09b9a5ceda2af799a289434f389774ad793d10762ac6ddb0e2b'
            'c333b13279cccb08ad0ba9be9744ce8b962cff49b09b4b0f17e5cc0640f13661'
            '7ef452d18c87747ca924c2e7a71e4329c4d975a8dc6748a5fd7324843659b912'
            'cd4922598a7909f6bfb18ac3dbf74c455b1006402aca1b3e64253390ae94acbb')
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
